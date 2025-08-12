import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:potion_maker/controllers/controllers.dart';
import 'package:potion_maker/models/models.dart';
import 'package:potion_maker/utils/utils.dart';
import 'package:potion_maker/widgets/widgets.dart';

import '../repositories/repositories.dart';

class WheelGameScreen extends StatefulWidget {
  const WheelGameScreen({super.key});

  @override
  State<WheelGameScreen> createState() => _WheelGameScreenState();
}

class _WheelGameScreenState extends State<WheelGameScreen> {
  late final controller = Get.put(
    PotionWheelController(Get.find(), showResult),
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            left: -5.w,
            child: Image.asset(
              'assets/png/wheel_game_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 23.h,
            child: SizedBox(
              width: 258.r,
              height: 287.r,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: 0,
                    child: Obx(
                      () => Transform.rotate(
                        angle: controller.rotationAngle.value * (pi / 180),
                        child: Image.asset(
                          'assets/png/wheel_bg.png',
                          width: 258.r,
                          height: 258.r,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: Image.asset(
                      'assets/png/wheel_indicator.png',
                      width: 48.r,
                      height: 51.r,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 19.h,
            child: SizedBox(
              width: 302.r,
              height: 50.r,
              child: Obx(() {
                return Opacity(
                  opacity: controller.isSpinning.value ? 0.5 : 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LabeledButton(
                        label: "MAX BET",
                        width: 92.r,
                        height: 50.r,
                        textStyle: AppTextStyles.ls17.copyWith(fontSize: 17.r),
                        onTap: controller.maxBet,
                      ),
                      BetBox(
                        bet: controller.currentBet.value,
                        onIncrease: controller.increaseBet,
                        onDecrease: controller.decreaseBet,
                      ),
                      Opacity(
                        opacity: controller.canSpin ? 1 : 0.5,
                        child: LabeledButton(
                          label: "SPIN",
                          width: 92.r,
                          height: 50.r,
                          textStyle: AppTextStyles.ls17.copyWith(
                            fontSize: 17.r,
                          ),
                          onTap: controller.spinWheel,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          Positioned(
            top: 69.h,
            left: 29.w,
            child: GetBuilder<AppConfigController>(
              builder: (controller) {
                return BooksShelf(
                  types: [PotionType.normal, PotionType.common],
                  potions1: RecipesRepository.normalPotions,
                  potions2: RecipesRepository.commonPotions,
                  availableRecipes: controller.availableRecipes,
                );
              },
            ),
          ),
          Positioned(
            top: 69.h,
            right: 65.w,
            child: GetBuilder<AppConfigController>(
              builder: (controller) {
                return BooksShelf(
                  types: [PotionType.rare, PotionType.veryRare],
                  potions1: RecipesRepository.rarePotions,
                  potions2: RecipesRepository.veryRarePotions,
                  availableRecipes: controller.availableRecipes,
                );
              },
            ),
          ),
          Positioned(
            top: 19.h,
            left: 30.w,
            child: GestureDetector(
              onTap: Get.back,
              child: Image.asset(
                'assets/png/back.png',
                width: 81.r,
                height: 62.r,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 16.h,
            right: 25.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    RecipesButton(),
                    BudgetBox(),
                    SizedBox(width: 14.w),
                    MenuButton(),
                  ],
                ),
                GestureDetector(
                  onTap: showInfoDialog,
                  child: Image.asset(
                    'assets/png/info.png',
                    width: 60.r,
                    height: 67.r,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showResult(Potion? potion, int loss) {
    showDialog(
      context: context,
      useSafeArea: false,
      barrierColor: Colors.black.withAlpha(16),
      builder: (context) => WheelResultDialog(
        potion: potion,
        loss: loss,
        onOpen: () => showRecipeDialog(potion),
      ),
    );
  }

  void showRecipeDialog(potion) {
    showDialog(
      context: context,
      useSafeArea: false,
      barrierColor: Colors.black.withAlpha(16),
      builder: (context) => RecipeDialog(potion: potion),
    );
  }

  void showInfoDialog() {
    showDialog(
      context: context,
      useSafeArea: false,
      barrierColor: Colors.black.withAlpha(16),
      builder: (context) => WheelGameInfoDialog(),
    );
  }
}
