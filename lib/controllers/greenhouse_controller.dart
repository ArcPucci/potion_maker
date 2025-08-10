import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:potion_maker/models/models.dart';
import 'package:potion_maker/repositories/repositories.dart';

class GreenhouseController extends GetxController {
  final AppConfigRepository _appConfigRepository;

  GreenhouseController(this._appConfigRepository) {
    init();
  }

  List<int> _availableBeds = [];

  List<int> get availableBeds => _availableBeds;

  List<String> _availableFlowers = [];

  List<String> get availableFlowers => _availableFlowers;

  List<FlowerModel> _flowers = [];

  List<FlowerModel> get flowers => _flowers;

  List<BedModel> _beds = [];

  List<BedModel> get beds => _beds;

  List<String> get ripedFlowers => _beds
      .where((e) => e.flowerModel != null)
      .map((e) => e.flowerModel!.flower.asset)
      .toList();

  Map<int, String> _bedsMap = {};

  Bed? _selectedBed;

  void init() async {
    _availableBeds = _appConfigRepository.getAvailableBeds();
    _availableFlowers = _appConfigRepository.getAvailableFlowers();
    await _updateBeds();
  }

  void buyFlower(Flower flower) async {
    _availableFlowers.add(flower.asset);
    await _appConfigRepository.setAvailableFlowers(_availableFlowers);
    update();
  }

  void buyBed(Bed bed) async {
    _availableBeds.add(bed.id);
    await _appConfigRepository.setAvailableBeds(_availableBeds);
    update();
  }

  void selectBed(Bed bed) {
    _selectedBed = bed;
  }

  void plantFlower(Flower flower) async {
    if (_selectedBed == null) return;
    _bedsMap[_selectedBed!.id] = flower.asset;
    await _appConfigRepository.setBedsConfig(_bedsMap);
    await _appConfigRepository.updateFlower(
      flower.asset,
      DateTime.now(),
      false,
    );

    update();
    await _updateBeds();
  }

  Future<void> _updateBeds() async {
    _bedsMap = Map<int, String>.from(_appConfigRepository.getBedsConfig());
    _beds.clear();

    for (var bed in GreenhouseRepository.bedsList) {
      final flower = _bedsMap[bed.id] ?? '';

      if (flower.isEmpty) {
        _beds.add(BedModel(bed: bed));
        continue;
      }

      final flowerModel = GreenhouseRepository.warehouse.firstWhere(
            (e) => e.asset == flower,
      );

      final flowerInfo = _appConfigRepository.getFlowerInfo(flower);
      final parts = flowerInfo.split(',');
      if (parts.length < 2) {
        debugPrint('Invalid flower info for $flower');
        _beds.add(BedModel(bed: bed));
        continue;
      }

      final dateInMicroSeconds = int.tryParse(parts[0]) ?? 0;
      final riped = parts[1] == '1';

      final date = DateTime.fromMicrosecondsSinceEpoch(dateInMicroSeconds);

      final bedModel = BedModel(
        bed: bed,
        flowerModel: FlowerModel(
          flower: flowerModel,
          dateTime: date,
          riped: riped,
        ),
      );

      _beds.add(bedModel);

      if (!bedModel.flowerModel!.riped &&
          bedModel.flowerModel!.secondsToRipe > 0) {
        bedModel.timer?.cancel();
        bedModel.timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          update();

          if (bedModel.flowerModel!.secondsToRipe <= 0) {
            timer.cancel();
            bedModel.flowerModel!.riped = true;
            _appConfigRepository.updateFlower(
              bedModel.flowerModel!.flower.asset,
              bedModel.flowerModel!.dateTime,
              true,
            );
            update();
          }
        });
      }
    }

    update();
  }
}
