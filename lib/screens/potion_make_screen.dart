import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:potion_maker/controllers/controllers.dart';
import 'package:potion_maker/models/models.dart';
import 'package:potion_maker/repositories/repositories.dart';
import 'package:potion_maker/utils/utils.dart';

import '../widgets/widgets.dart';

class PotionMakeScreen extends StatelessWidget {
  const PotionMakeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(
      PotionMakerController(
        (won, correct, wrong, sum) =>
            showResultDialog(context, won, correct, wrong, sum),
        Get.find(),
        Get.find(),
      ),
    );
    return PopScope(
      canPop: false,
      child: Material(
        child: GetBuilder<PotionMakerController>(
          builder: (controller) {
            final playing = controller.status == GameStatus.playing;
            return Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/png/main_game_bg.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: -94.r,
                  child: AnimatedBoiler(
                    animate: controller.boilerAnimating,
                    type: controller.potionType,
                    onAccept: controller.addedDust,
                    onCompleted: controller.potionCompleted,
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Image.asset(
                    'assets/png/left_table.png',
                    width: 334.r,
                    height: 97.r,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Image.asset(
                    'assets/png/right_table.png',
                    width: 327.r,
                    height: 97.r,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned.fill(
                  child: controller.status == GameStatus.idle
                      ? _buildGameIntro(controller)
                      : _buildGameProcess(context, controller),
                ),
                _buildSymbol(controller.canMake),
                Positioned(
                  right: 179.r,
                  bottom: 15.r,
                  child: StoneCupWidget(
                    hasButton: controller.canGrind,
                    onGrind: controller.onGrind,
                  ),
                ),
                Positioned(
                  top: 19.h,
                  left: 31.w,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: Get.back,
                        child: Image.asset(
                          'assets/png/back.png',
                          width: 81.r,
                          height: 62.r,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(width: 13.r),
                      if (controller.showIngredients)
                        _buildPotions(context, controller),
                    ],
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
                          RecipesButton(
                            onTap: playing
                                ? () async {
                                    controller.pauseGame();
                                    await showRecipesDialog(context);
                                    controller.resumeGame();
                                  }
                                : null,
                          ),
                          BudgetBox(
                            onTapPlus: playing
                                ? () async {
                                    controller.pauseGame();
                                    await showCoinsDialog(context);
                                    controller.resumeGame();
                                  }
                                : null,
                          ),
                          SizedBox(width: 14.w),
                          MenuButton(
                            onTap: controller.status == GameStatus.idle
                                ? null
                                : () async {
                                    controller.pauseGame();
                                    await showMenuDialog(context);
                                    controller.resumeGame();
                                  },
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
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
                if (controller.status == GameStatus.intro)
                  Positioned.fill(child: _buildIntroTimer(controller)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildIntroTimer(PotionMakerController controller) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
      child: Center(
        child: Obx(
          () => Text(
            "${controller.introTime.value}",
            style: AppTextStyles.ls96.copyWith(fontSize: 96.r),
          ),
        ),
      ),
    );
  }

  Widget _buildGameIntro(PotionMakerController controller) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 6.r,
          bottom: 48.r,
          child: Image.asset(
            'assets/png/big_flower.png',
            width: 137.r,
            height: 129.r,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          left: 138.r,
          bottom: 27.r,
          child: Image.asset(
            'assets/png/big_books.png',
            width: 140.r,
            height: 101.r,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          right: 27.r,
          bottom: 38.r,
          child: Image.asset(
            'assets/png/big_bottle_2.png',
            width: 59.r * 1.1,
            height: 123.r * 1.1,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          right: 84.r,
          bottom: 41.r,
          child: Image.asset(
            'assets/png/big_bottle.png',
            width: 81.r * 1.1,
            height: 109.r * 1.1,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          right: 64.r,
          bottom: 25.r,
          child: Image.asset(
            'assets/png/small_flower.png',
            width: 63.r,
            height: 55.r,
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 40.r),
          child: LabeledButton(
            label: "START",
            width: 167.r,
            height: 61.r,
            textStyle: AppTextStyles.ls24.copyWith(fontSize: 24.r),
            onTap: controller.startGame,
          ),
        ),
      ],
    );
  }

  Widget _buildGameProcess(
    BuildContext context,
    PotionMakerController controller,
  ) {
    final canDrag = controller.canMake == null && !controller.canGrind;
    return Stack(
      alignment: Alignment.center,
      children: [
        ...List.generate(PotionMakerRepository.bigFlowers.length, (index) {
          final bigFlower = PotionMakerRepository.bigFlowers[index];
          final locked = !controller.availableIngredients.contains(
            bigFlower.flower.asset,
          );
          return Positioned(
            left: bigFlower.left,
            bottom: bigFlower.bottom,
            child: BigFlowerCard(
              canDrag: canDrag,
              locked: locked,
              bigFlower: bigFlower,
            ),
          );
        }),
        ...List.generate(PotionMakerRepository.crystals.length, (index) {
          final crystal = PotionMakerRepository.crystals[index];
          final locked = !controller.availableIngredients.contains(
            crystal.crystal.asset,
          );
          return Positioned(
            right: crystal.right,
            bottom: crystal.bottom,
            child: CrystalCard(
              canDrag: canDrag,
              locked: locked,
              crystal: crystal,
              onBuy: () async {
                controller.pauseGame();
                await showCrystalDialog(context, crystal);
                controller.resumeGame();
              },
            ),
          );
        }),
        Positioned(
          top: 94.h,
          child: Obx(() => TimerBox(seconds: controller.remaining.value)),
        ),
        if (controller.hasDust)
          Positioned(
            top: 145.r,
            right: 196.r,
            child: Container(
              width: 74.r,
              height: 73.r,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/png/circle_bg.png'),
                  fit: BoxFit.fill,
                ),
              ),
              alignment: Alignment.center,
              child: Draggable(
                data: controller.currentPotionType,
                feedback: Image.asset(
                  controller.dustAsset,
                  width: 51.r,
                  height: 28.r,
                  fit: BoxFit.fill,
                ),
                child: Image.asset(
                  controller.dustAsset,
                  width: 51.r,
                  height: 28.r,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        if (!controller.hasDust)
          Positioned(
            top: 141.r,
            right: 85.r,
            child: SizedBox(
              width: 260.r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  final ingredient = controller.ingredients[index];
                  return IngredientCard(
                    index: index,
                    active: index < controller.countIngredients,
                    empty: index > controller.countIngredients,
                    ingredientModel: ingredient,
                    onAccept: (item) => controller.addIngredient(index, item),
                  );
                }),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildPotions(BuildContext context, PotionMakerController controller) {
    return SizedBox(
      width: 275.r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(controller.potions.length, (index) {
          final potion = controller.potions[index];
          final ticket = _getTicket(potion.type);
          final value = _getTicketValue(potion.type);
          final potionMade = controller.potionMade[index];
          final hasTicket = controller.currentPotion >= index;
          return Opacity(
            opacity: hasTicket ? 1 : 0.5,
            child: SizedBox(
              width: 64.r,
              height: 82.r,
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: SizedBox(
                      width: 57.r,
                      height: 76.r,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: 0,
                            child: Container(
                              width: 57.r,
                              height: 57.r,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/png/paper_square.png',
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    potion.asset,
                                    width: 25.r,
                                    height: 39.r,
                                  ),
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: CustomBorderedText(
                                      text: potion.name,
                                      strokeWidth: 1.sp,
                                      strokeColor: AppTheme.darkOrange2,
                                      textStyle: AppTextStyles.ls10.copyWith(
                                        fontSize: 10.r,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (hasTicket)
                            Positioned(
                              left: 0,
                              bottom: 0,
                              child: SizedBox(
                                width: 51.r,
                                height: 23.r,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                      right: 0,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.asset(
                                            ticket,
                                            width: 47.r,
                                            height: 23.r,
                                            fit: BoxFit.fill,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 3.r,
                                              left: 3.r,
                                            ),
                                            child: Text(
                                              "$value",
                                              style: AppTextStyles.lo13
                                                  .copyWith(fontSize: 13.r),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      child: Image.asset(
                                        'assets/png/cent.png',
                                        width: 17.r,
                                        height: 17.r,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  if (potionMade != null)
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Image.asset(
                        potionMade
                            ? 'assets/png/correct.png'
                            : 'assets/png/wrong.png',
                        width: 20.r,
                        height: 20.r,
                        fit: BoxFit.fill,
                      ),
                    ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  void showResultDialog(
    BuildContext context,
    bool? won,
    int correct,
    int wrong,
    int sum,
  ) {
    showDialog(
      context: context,
      useSafeArea: false,
      barrierColor: Colors.black.withAlpha(16),
      barrierDismissible: false,
      builder: (context) => PotionMakerResultDialog(
        won: won,
        correct: correct,
        wrong: wrong,
        sum: sum,
      ),
    );
  }

  Future<void> showCrystalDialog(BuildContext context, crystalModel) async {
    await showDialog(
      context: context,
      useSafeArea: false,
      barrierColor: Colors.black.withAlpha(16),
      builder: (context) => CrystalDialog(crystalModel: crystalModel),
    );
  }

  Future<void> showMenuDialog(context) async {
    await showDialog(
      context: context,
      useSafeArea: false,
      barrierColor: Colors.black.withAlpha(16),
      builder: (context) => MenuDialog(paused: true),
    );
  }

  Future<void> showCoinsDialog(context) async {
    await showDialog(
      context: context,
      useSafeArea: false,
      barrierColor: Colors.black.withAlpha(16),
      builder: (context) => CoinsShopDialog(),
    );
  }

  Future<void> showRecipesDialog(context) async {
    await showDialog(
      context: context,
      useSafeArea: false,
      barrierColor: Colors.black.withAlpha(16),
      builder: (context) => ShelfDialog(),
    );
  }

  String _getTicket(PotionType type) {
    switch (type) {
      case PotionType.normal:
        return 'assets/png/green_ticket.png';
      case PotionType.common:
        return 'assets/png/red_ticket.png';
      case PotionType.rare:
        return 'assets/png/pink_ticket.png';
      case PotionType.veryRare:
        return 'assets/png/blue_ticket.png';
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

  Widget _buildSymbol(bool? canMake) {
    if (canMake == null) return SizedBox();

    if (canMake) {
      return Image.asset(
        'assets/png/big_correct.png',
        width: 156.r,
        height: 130.r,
        fit: BoxFit.fill,
      );
    }

    return Image.asset(
      'assets/png/big_wrong.png',
      width: 143.r,
      height: 143.r,
      fit: BoxFit.fill,
    );
  }
}
