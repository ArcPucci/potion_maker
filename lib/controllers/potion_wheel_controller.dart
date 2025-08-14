import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:potion_maker/controllers/controllers.dart';
import 'package:potion_maker/models/models.dart';
import 'package:potion_maker/repositories/repositories.dart';

class PotionWheelController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final AppConfigController _appConfigController;
  final void Function(Potion? potion, int loss) showResult;

  PotionWheelController(this._appConfigController, this.showResult);

  final items = [
    "",
    "forest_dust",
    "ether_cry",
    "petal_brew",
    "crystal_dream",
    "mist_drop",
    "ether_cry",
    "sweet_bubble",
    "root_of_luck",
    "shadow_elixir",
    "",
    "forest_dust",
    "ashen_glow",
    "",
    "petal_brew",
    "shadow_elixir",
    "mist_drop",
    "dew_of_peace",
    "timeless_surge",
    "root_of_luck",
    "whisper",
  ];

  int get coins => _appConfigController.coins.value;

  late AnimationController _animationController;
  late Animation<double> _animation;

  final RxDouble rotationAngle = 0.0.obs;
  final RxBool isSpinning = false.obs;
  final RxInt selectedIndex = (-1).obs;

  final Random _random = Random();

  RxInt currentBet = 0.obs;

  bool get canIncrease => coins > currentBet.value;

  bool get canDecrease => currentBet.value > 0;

  bool get canSpin => currentBet.value > 0;

  bool _paused = false;

  static const _step = 100;

  @override
  void onInit() {
    super.onInit();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _animationController.addListener(() {
      rotationAngle.value = _animation.value;
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isSpinning.value = false;
        print('Winner: ${items[selectedIndex.value]}');
        final asset = 'assets/png/potions/${items[selectedIndex.value]}.png';
        final potion = RecipesRepository.potionsList.firstWhereOrNull(
          (e) => e.asset == asset,
        );

        if (potion != null) _appConfigController.addRecipe(potion);

        showResult(potion, currentBet.value);
      }
    });
  }

  void spinWheel() {
    if (isSpinning.value) return;
    if (coins < currentBet.value) return;

    isSpinning.value = true;
    selectedIndex.value = -1;
    _appConfigController.addCoins(-currentBet.value);

    final int totalSectors = items.length;
    final int winningIndex = _random.nextInt(totalSectors);
    selectedIndex.value = winningIndex;

    final double sectorAngle = 360 / totalSectors;

    final double offset = sectorAngle / 2;
    final double endAngle =
        (5 * 360) + (360 - (winningIndex * sectorAngle) - offset);

    _animation = Tween<double>(begin: rotationAngle.value % 360, end: endAngle)
        .animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );

    _animationController.forward(from: 0);
  }

  void increaseBet() {
    if (isSpinning.value) return;
    if (!canIncrease) return;
    currentBet.value += _step;
  }

  void decreaseBet() {
    if (isSpinning.value) return;
    if (!canDecrease) return;
    currentBet.value -= _step;
  }

  void maxBet() {
    if (isSpinning.value) return;
    currentBet.value = (coins ~/ _step) * _step;
  }

  void pauseSpin() {
    if (_animationController.isAnimating) {
      _animationController.stop();
      _paused = true;
    }
  }

  void resumeSpin() {
    if (!_paused) return;
    if (!_animationController.isAnimating && _animationController.value < 1.0) {
      _animationController.forward();
      _paused = false;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
