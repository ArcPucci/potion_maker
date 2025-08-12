import 'package:get/get.dart';
import 'package:potion_maker/models/models.dart';

import '../repositories/repositories.dart';

class AppConfigController extends GetxController {
  final AppConfigRepository _appConfigRepository;

  AppConfigController(this._appConfigRepository) {
    initController();
  }

  RxBool musicValue = true.obs;
  RxBool soundValue = true.obs;
  RxInt coins = 500.obs;

  List<String> _availableRecipes = [];

  List<String> get availableRecipes => _availableRecipes;

  bool get firstInit => _appConfigRepository.isFirstInit();

  void initController() {
    musicValue.value = _appConfigRepository.getMusic();
    soundValue.value = _appConfigRepository.getSound();
    coins.value = _appConfigRepository.getCoins();
    _availableRecipes = _appConfigRepository.getAvailableRecipes();
  }

  void toggleMusic(bool value) async {
    musicValue.value = value;
    await _appConfigRepository.setMusic(value);
  }

  void toggleSound(bool value) async {
    soundValue.value = value;
    await _appConfigRepository.setSound(value);
  }

  void addCoins(int value) async {
    coins.value += value;
    await _appConfigRepository.setCoins(coins.value);
    update();
  }

  void addRecipe(Potion potion) async {
    if(_availableRecipes.contains(potion.asset)) return;
    _availableRecipes.add(potion.asset);
    await _appConfigRepository.setAvailableRecipes(_availableRecipes);
    update();
  }

  void setFirstInit() async {
    await _appConfigRepository.setFirstInit();
  }
}
