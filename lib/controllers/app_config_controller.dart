import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:potion_maker/models/models.dart';

import '../repositories/repositories.dart';

class AppConfigController extends GetxController {
  final AppConfigRepository _appConfigRepository;

  AppConfigController(this._appConfigRepository) {
    initController();
  }

  final AudioPlayer _player = AudioPlayer();
  final AudioPlayer _player2 = AudioPlayer();

  RxBool musicValue = true.obs;
  RxBool soundValue = true.obs;
  RxInt coins = 500.obs;

  List<String> _availableRecipes = [];

  List<String> get availableRecipes => _availableRecipes;

  bool get firstInit => _appConfigRepository.isFirstInit();

  bool get welcome => _appConfigRepository.getWelcome();

  void initController() async {
    await _player.setAsset('assets/audio/magic.mp3');
    await _player2.setAsset('assets/audio/click.mp3');

    musicValue.value = _appConfigRepository.getMusic();
    soundValue.value = _appConfigRepository.getSound();
    coins.value = _appConfigRepository.getCoins();
    _availableRecipes = _appConfigRepository.getAvailableRecipes();
    if (musicValue.value) await _playMusic();
  }

  void toggleMusic(bool value) async {
    musicValue.value = value;
    await _appConfigRepository.setMusic(value);
    value ? await _playMusic() : await _player.stop();
  }

  void toggleSound(bool value) async {
    soundValue.value = value;
    await _appConfigRepository.setSound(value);
    playSound();
  }

  void addCoins(int value) async {
    coins.value += value;
    await _appConfigRepository.setCoins(coins.value);
    update();
  }

  void addRecipe(Potion potion) async {
    if (_availableRecipes.contains(potion.asset)) return;
    _availableRecipes.add(potion.asset);
    await _appConfigRepository.setAvailableRecipes(_availableRecipes);
    update();
  }

  void setFirstInit() async {
    await _appConfigRepository.setFirstInit();
  }

  void setWelcome() async {
    await _appConfigRepository.setWelcome();
  }

  Future<void> _playMusic() async {
    try {
      await _player.play();
      _player.setLoopMode(LoopMode.all);
    } catch (e) {
      print(e);
    }
  }

  void playSound() async {
    try {
      if (soundValue.value) {
        _player2.seek(Duration.zero);
        _player2.play();
      }
    } catch (e) {
      print(e);
    }
  }
}
