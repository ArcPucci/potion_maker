import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';
import 'package:potion_maker/controllers/controllers.dart';
import 'package:potion_maker/models/models.dart';
import 'package:potion_maker/repositories/repositories.dart';

enum GameStatus { idle, intro, playing, paused, finished }

class PotionMakerController extends GetxController {
  final AppConfigRepository _appConfigRepository;
  final AppConfigController _appConfigController;
  final void Function(bool? won, int correct, int wrong, int sum)
  onGameFinished;

  PotionMakerController(
    this.onGameFinished,
    this._appConfigRepository,
    this._appConfigController,
  ) {
    init();
  }

  int get coins => _appConfigController.coins.value;

  Timer? _timer;

  int _sum = 0;

  static const _initTime = 180;

  RxInt introTime = 3.obs;

  RxInt remaining = _initTime.obs;

  GameStatus _status = GameStatus.idle;

  GameStatus get status => _status;

  int get currentPotion => _currentPotion;

  bool _hasDust = false;

  bool get hasDust => _hasDust;

  PotionType get currentPotionType => _potions[_currentPotion].type;

  String get dustAsset => switch (_potions[_currentPotion].type) {
    PotionType.normal => 'assets/png/green_dust.png',
    PotionType.common => 'assets/png/red_dust.png',
    PotionType.rare => 'assets/png/pink_dust.png',
    PotionType.veryRare => 'assets/png/purple_dust.png',
  };

  PotionType? _potionType;

  PotionType? get potionType => _potionType;

  int _currentPotion = 0;

  List<bool?> _potionMade = [null, null, null, null];

  List<bool?> get potionMade => _potionMade;

  bool? get canMake => _potionMade[_currentPotion];

  List<IngredientModel?> _ingredients = [null, null, null, null];

  List<IngredientModel?> get ingredients => _ingredients;

  List<Potion> _potions = [];

  List<String> _availableIngredients = [];

  List<String> get availableIngredients => _availableIngredients;

  List<Potion> get potions => _potions;

  bool get showIngredients => _status == GameStatus.playing;

  bool get boilerAnimating => _status == GameStatus.playing;

  bool get canGrind =>
      _potionMade[_currentPotion] == null &&
      _ingredients.where((e) => e?.correct ?? false).length == countIngredients;

  int get countIngredients => _potions[_currentPotion].recipe.length - 1;

  void init() {
    _sum = 0;
    _updateAvailableIngredients();
    _generatePotions();
    _ingredients = [null, null, null, null];
    introTime.value = 3;
    _hasDust = false;
    _potionType = null;
    remaining.value = _initTime;
    _status = GameStatus.idle;
    _potionMade = [null, null, null, null];
    update();
  }

  void startGame() {
    _status = GameStatus.intro;
    update();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      introTime.value--;
      if (introTime.value == 0) resumeGame();
    });
  }

  void addIngredient(int index, Ingredient ingredient) async {
    if (_ingredients.map((e) => e?.ingredient).contains(ingredient)) return;
    if (_ingredients[index] != null) return;
    final correct = _potions[_currentPotion].recipe.where(
      (e) => e.asset == ingredient.asset,
    );

    _ingredients[index] = IngredientModel(
      ingredient: ingredient,
      correct: correct.isNotEmpty,
    );

    if (correct.isEmpty) _potionMade[_currentPotion] = false;
    update();

    if (correct.isNotEmpty) return;

    await Future.delayed(Duration(seconds: 1));
    _nextPotion();

    update();
  }

  void onGrind() {
    if (_hasDust) return;
    _hasDust = true;
    update();
  }

  void pauseGame() {
    _status = GameStatus.paused;
    _timer?.cancel();
    update();
    print('paused');
  }

  void resumeGame() {
    _status = GameStatus.playing;
    _timer?.cancel();
    update();

    print('resumed');

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_status != GameStatus.playing) return;
      remaining.value--;
      if (remaining.value == 0) {
        final won = _potionMade.where((e) => e == true);
        final wrong = _potionMade.where((e) => e == false);
        onGameFinished(
          won.isNotEmpty ? null : false,
          won.length,
          wrong.length,
          _sum,
        );
        _appConfigController.addCoins(_sum);
        _status = GameStatus.finished;
        _timer?.cancel();
      }
    });
  }

  void addedDust(PotionType type) {
    _potionType = type;
    update();
  }

  void potionCompleted() async {
    _potionMade[_currentPotion] = true;
    _sum += _getTicketValue(_potions[_currentPotion].type);
    update();

    await Future.delayed(Duration(seconds: 3));

    _nextPotion();
    update();
  }

  void _nextPotion() {
    if (_currentPotion == _potions.length - 1) {
      final won = _potionMade.where((e) => e == true);
      final wrong = _potionMade.where((e) => e == false);
      onGameFinished(
        won.isNotEmpty ? null : false,
        won.length,
        wrong.length,
        _sum,
      );
      _appConfigController.addCoins(_sum);
      _timer?.cancel();
      return;
    }

    _hasDust = false;
    _potionType = null;
    _currentPotion++;
    for (var i = 0; i < _ingredients.length; i++) {
      _ingredients[i] = null;
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void _updateAvailableIngredients() {
    _availableIngredients.clear();
    final flowers = _appConfigRepository.getRippedFlowers();
    final crystals = _appConfigRepository.getBoughtCrystals();

    for (var flower in PotionMakerRepository.bigFlowers) {
      if (!flowers.contains(flower.flower.asset)) continue;
      _availableIngredients.add(flower.flower.asset);
    }

    for (var crystal in PotionMakerRepository.crystals) {
      if (!crystals.contains(crystal.crystal.asset)) continue;
      _availableIngredients.add(crystal.crystal.asset);
    }

    _availableIngredients.add("assets/png/stone_cup.png");
  }

  void _generatePotions() {
    for (var potion in RecipesRepository.potionsList) {
      if (_potions.contains(potion)) continue;
      if (potion.recipe.every((e) => _availableIngredients.contains(e.asset))) {
        _potions.add(potion);
      }
    }

    _potions.shuffle();

    if (_potions.length < 4) {
      int rand = Random().nextInt(RecipesRepository.potionsList.length);
      while (_potions.contains(RecipesRepository.potionsList[rand])) {
        rand = Random().nextInt(RecipesRepository.potionsList.length);
      }

      _potions.add(RecipesRepository.potionsList[rand]);
    }
  }

  int _getTicketValue(PotionType type) {
    switch (type) {
      case PotionType.normal:
        return 20;
      case PotionType.common:
        return 50;
      case PotionType.rare:
        return 80;
      case PotionType.veryRare:
        return 100;
    }
  }

  void buyCrystal(Crystal crystal) async {
    final list = _appConfigRepository.getBoughtCrystals();
    if (list.contains(crystal.asset)) return;
    _appConfigController.addCoins(-crystal.price);
    list.add(crystal.asset);
    await _appConfigRepository.setBoughtCrystals(list);
    _availableIngredients.add(crystal.asset);
    update();
  }

  void onTapMenu() {
    Get.back();
  }

  void playAgain() {
    init();
  }
}
