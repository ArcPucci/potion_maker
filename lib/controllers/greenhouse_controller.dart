import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:potion_maker/controllers/controllers.dart';
import 'package:potion_maker/models/models.dart';
import 'package:potion_maker/repositories/repositories.dart';

class GreenhouseController extends GetxController
    with GetTickerProviderStateMixin {
  final AppConfigRepository _appConfigRepository;
  final AppConfigController _appConfigController;

  GreenhouseController(this._appConfigRepository, this._appConfigController) {
    init();
  }

  List<String> _rippedFlowers = [];

  int get coins => _appConfigController.coins.value;

  List<int> _availableBeds = [];

  List<int> get availableBeds => _availableBeds;

  List<String> _availableFlowers = [];

  List<String> get availableFlowers => _availableFlowers;

  final List<BedModel> _beds = [];

  List<BedModel> get beds => _beds;

  List<String> get ripedFlowers => _beds
      .where((e) => e.flowerModel != null)
      .map((e) => e.flowerModel!.flower.asset)
      .toList();

  Map<int, String> _bedsMap = {};

  int? _selectedBed;

  void init() async {
    _availableBeds = _appConfigRepository.getAvailableBeds();
    _availableFlowers = _appConfigRepository.getAvailableFlowers();
    _rippedFlowers = _appConfigRepository.getRippedFlowers();
    await _updateBeds();
  }

  void buyFlower(Flower flower) async {
    if (coins < flower.price) return;
    _availableFlowers.add(flower.asset);
    _appConfigController.addCoins(-flower.price);
    await _appConfigRepository.setAvailableFlowers(_availableFlowers);
    update();
  }

  void buyBed(int index) async {
    final bedModel = _beds[index];
    final bed = bedModel.bed;

    if (coins < bed.price) return;
    _availableBeds.add(bed.id);
    _appConfigController.addCoins(-bed.price);
    await _appConfigRepository.setAvailableBeds(_availableBeds);
    update();

    _beds[index].controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..forward().whenComplete(() => _beds[index].controller = null);
  }

  void selectBed(int index) {
    _selectedBed = index;
  }

  void plantFlower(Flower flower) async {
    if (_selectedBed == null) return;
    final bedModel = _beds[_selectedBed!];
    _bedsMap[bedModel.bed.id] = flower.asset;
    await _appConfigRepository.setBedsConfig(_bedsMap);
    await _appConfigRepository.updateFlower(
      flower.asset,
      DateTime.now(),
      false,
      false,
    );
    update();
    await _updateBeds();

    _beds[_selectedBed!].controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..forward().whenComplete(() => _beds[_selectedBed!].controller = null);
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
      final showedAnimation = parts[2] == '1';

      final date = DateTime.fromMicrosecondsSinceEpoch(dateInMicroSeconds);

      final bedModel = BedModel(
        bed: bed,
        flowerModel: FlowerModel(
          flower: flowerModel,
          dateTime: date,
          riped: riped,
          showedAnimation: showedAnimation,
        ),
      );

      if (dateInMicroSeconds != -1 && !showedAnimation) {
        bedModel.flowerModel!.controller = AnimationController(
          vsync: this,
          duration: const Duration(seconds: 2),
        );
      }

      _beds.add(bedModel);
      update();

      if (!bedModel.flowerModel!.riped &&
          bedModel.flowerModel!.secondsToRipe > 0) {
        bedModel.timer?.cancel();
        bedModel.timer = Timer.periodic(const Duration(seconds: 1), (
          timer,
        ) async {
          update();

          if (bedModel.flowerModel!.secondsToRipe <= 0) {
            timer.cancel();
            bedModel.flowerModel!.riped = true;
            await _appConfigRepository.updateFlower(
              bedModel.flowerModel!.flower.asset,
              bedModel.flowerModel!.dateTime,
              true,
              false,
            );

            update();

            bedModel.flowerModel!.controller?.forward().whenComplete(() async {
              _appConfigRepository.updateFlower(
                bedModel.flowerModel!.flower.asset,
                bedModel.flowerModel!.dateTime,
                true,
                true,
              );

              _rippedFlowers.add(bedModel.flowerModel!.flower.asset);
              await _appConfigRepository.setRippedFlowers(_rippedFlowers);

              bedModel.timer = null;
              bedModel.flowerModel!.showedAnimation = true;

              await Future.delayed(Duration(milliseconds: 300));
              bedModel.flowerModel!.controller = null;
            });
          }
        });
      } else if (dateInMicroSeconds != -1 && !showedAnimation) {
        bedModel.flowerModel!.riped = true;
        await _appConfigRepository.updateFlower(
          bedModel.flowerModel!.flower.asset,
          bedModel.flowerModel!.dateTime,
          true,
          false,
        );
        bedModel.flowerModel!.controller?.forward().whenComplete(() async {
          _appConfigRepository.updateFlower(
            bedModel.flowerModel!.flower.asset,
            bedModel.flowerModel!.dateTime,
            true,
            true,
          );

          _rippedFlowers.add(bedModel.flowerModel!.flower.asset);
          await _appConfigRepository.setRippedFlowers(_rippedFlowers);

          bedModel.timer = null;
          bedModel.flowerModel!.showedAnimation = true;

          await Future.delayed(Duration(milliseconds: 300));
          bedModel.flowerModel!.controller = null;
        });
      }
    }
  }

  @override
  void dispose() {
    for (var bed in _beds) {
      bed.controller?.dispose();
      bed.flowerModel?.controller?.dispose();
      bed.timer?.cancel();
    }
    super.dispose();
  }

  @override
  void onClose() {
    for (var bed in _beds) {
      bed.controller?.dispose();
      bed.flowerModel?.controller?.dispose();
      bed.timer?.cancel();
    }
    super.onClose();
  }
}
