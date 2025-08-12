import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigRepository {
  final SharedPreferences _preferences;

  AppConfigRepository(this._preferences);

  static const _coinsKey = "COINS_KEY";
  static const _soundKey = "SOUND_KEY";
  static const _musicKey = "MUSIC_KEY";
  static const _availableFlowersKey = "AVAILABLE_FLOWERS_KEY";
  static const _availableRecipesKey = "AVAILABLE_RECIPES_KEY";
  static const _availableBedsKey = "AVAILABLE_BEDS_KEY";
  static const _bedsConfigKey = "BEDS_CONFIG_KEY";
  static const _rippedFlowersKey = "RIPPED_FLOWERS_KEY";
  static const _boughtCrystalsKey = "BOUGHT_CRYSTALS_KEY";
  static const _firstInitKey = "FIRST_INIT_KEY";
  static const _welcomeKey = "WELCOME_KEY";

  Future<void> setWelcome() async {
    await _preferences.setBool(_welcomeKey, true);
  }

  bool getWelcome() {
    return _preferences.getBool(_welcomeKey) ?? false;
  }

  Future<void> setFirstInit() async {
    await _preferences.setBool(_firstInitKey, false);
  }

  bool isFirstInit() {
    return _preferences.getBool(_firstInitKey) ?? true;
  }

  Future<void> setBoughtCrystals(List<String> crystals) async {
    await _preferences.setStringList(_boughtCrystalsKey, crystals);
  }

  List<String> getBoughtCrystals() {
    return _preferences.getStringList(_boughtCrystalsKey) ?? [];
  }

  Future<void> setCoins(int coins) async {
    await _preferences.setInt(_coinsKey, coins);
  }

  int getCoins() {
    return _preferences.getInt(_coinsKey) ?? 1000;
  }

  Future<void> setSound(bool sound) async {
    await _preferences.setBool(_soundKey, sound);
  }

  bool getSound() {
    return _preferences.getBool(_soundKey) ?? true;
  }

  Future<void> setMusic(bool music) async {
    await _preferences.setBool(_musicKey, music);
  }

  bool getMusic() {
    return _preferences.getBool(_musicKey) ?? true;
  }

  Future<void> setAvailableBeds(List<int> beds) async {
    final list = beds.map((e) => e.toString()).toList();
    await _preferences.setStringList(_availableBedsKey, list);
  }

  List<int> getAvailableBeds() {
    final list =
        _preferences.getStringList(_availableBedsKey) ?? ['3', '4', '5'];
    return list.map((e) => int.parse(e)).toList();
  }

  Future<void> setAvailableFlowers(List<String> flowers) async {
    await _preferences.setStringList(_availableFlowersKey, flowers);
  }

  List<String> getAvailableFlowers() {
    return _preferences.getStringList(_availableFlowersKey) ??
        [
          "assets/png/flowers/flower1.png",
          "assets/png/flowers/flower2.png",
          "assets/png/flowers/flower3.png",
        ];
  }

  Future<void> setRippedFlowers(List<String> flowers) async {
    await _preferences.setStringList(_rippedFlowersKey, flowers);
  }

  List<String> getRippedFlowers() {
    return _preferences.getStringList(_rippedFlowersKey) ??
        [
          "assets/png/flowers/flower1.png",
          "assets/png/flowers/flower2.png",
          "assets/png/flowers/flower3.png",
        ];
  }

  Future<void> setAvailableRecipes(List<String> recipes) async {
    await _preferences.setStringList(_availableRecipesKey, recipes);
  }

  List<String> getAvailableRecipes() {
    return _preferences.getStringList(_availableRecipesKey) ?? [];
  }

  Future<void> setBedsConfig(Map<int, String> bedsConfig) async {
    try {
      final map = bedsConfig.map(
        (key, value) => MapEntry(key.toString(), value),
      );
      final json = jsonEncode(map);
      await _preferences.setString(_bedsConfigKey, json);
    } catch (e, stack) {
      debugPrint('Error saving bedsConfig: $e\n$stack');
    }
  }

  Map<int, String> getBedsConfig() {
    try {
      final json = _preferences.getString(_bedsConfigKey);
      if (json == null) {
        return Map<int, String>.from(_defaultBedsConfig);
      }
      final Map<String, dynamic> map = jsonDecode(json);
      return Map<int, String>.fromEntries(
        map.entries.map((e) => MapEntry(int.parse(e.key), e.value as String)),
      );
    } catch (e, stack) {
      debugPrint('Error reading bedsConfig: $e\n$stack');
      return Map<int, String>.from(_defaultBedsConfig);
    }
  }

  static const Map<int, String> _defaultBedsConfig = {
    0: '',
    1: '',
    2: '',
    3: 'assets/png/flowers/flower3.png',
    4: 'assets/png/flowers/flower1.png',
    5: 'assets/png/flowers/flower2.png',
  };

  Future<void> updateFlower(
    String asset,
    DateTime date,
    bool riped,
    bool showed,
  ) async {
    final dateInMicroSeconds = date.microsecondsSinceEpoch;
    await _preferences.setString(
      asset,
      "$dateInMicroSeconds,${riped ? 1 : 0},${showed ? 1 : 0}",
    );
  }

  String getFlowerInfo(String asset) {
    return _preferences.getString(asset) ?? "-1,1,0";
  }
}
