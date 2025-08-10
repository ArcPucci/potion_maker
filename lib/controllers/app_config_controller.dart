import 'package:get/get.dart';
import 'package:potion_maker/models/models.dart';

import '../repositories/repositories.dart';

class AppConfigController extends GetxController {
  final AppConfigRepository _appConfigRepository;

  AppConfigController(this._appConfigRepository);

  RxBool musicValue = true.obs;
  RxBool soundValue = true.obs;
  RxInt coins = 500.obs;

  List<String> _availableRecipes = [];

  List<String> get availableRecipes => _availableRecipes;

  void initController() {
    musicValue.value = _appConfigRepository.getMusic();
    soundValue.value = _appConfigRepository.getSound();
    coins.value = _appConfigRepository.getCoins();
    _availableRecipes = _appConfigRepository.getAvailableRecipes();
  }

  void toggleMusic(bool value) {
    musicValue.value = value;
  }

  void toggleSound(bool value) {
    soundValue.value = value;
  }

  void addCoins(int value) {
    coins.value += value;
    _appConfigRepository.setCoins(coins.value);
  }

  void addRecipe(Potion potion) async {
    _availableRecipes.add(potion.bookAsset);
    await _appConfigRepository.setAvailableRecipes(_availableRecipes);
    update();
  }
}
