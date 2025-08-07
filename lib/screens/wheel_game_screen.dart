import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:potion_maker/models/models.dart';
import 'package:potion_maker/utils/utils.dart';
import 'package:potion_maker/widgets/widgets.dart';

import '../repositories/repositories.dart';

class WheelGameScreen extends StatelessWidget {
  const WheelGameScreen({super.key});

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
                    child: Image.asset(
                      'assets/png/wheel_bg.png',
                      width: 258.r,
                      height: 258.r,
                      fit: BoxFit.fill,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LabeledButton(
                    label: "MAX BET",
                    width: 92.r,
                    height: 50.r,
                    textStyle: AppTextStyles.ls17,
                  ),
                  BetBox(),
                  LabeledButton(
                    label: "SPIN",
                    width: 92.r,
                    height: 50.r,
                    textStyle: AppTextStyles.ls17,
                    onTap: () =>
                        showResult(context, RecipeRepository.potionsList.first),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 69.h,
            left: 29.w,
            child: BooksShelf(
              types: [PotionType.normal, PotionType.common],
              potions1: RecipeRepository.normalPotions,
              potions2: RecipeRepository.commonPotions,
            ),
          ),
          Positioned(
            top: 69.h,
            right: 65.w,
            child: BooksShelf(
              types: [PotionType.rare, PotionType.veryRare],
              potions1: RecipeRepository.rarePotions,
              potions2: RecipeRepository.veryRarePotions,
            ),
          ),
          Positioned(
            top: 19.h,
            left: 30.w,
            child: GestureDetector(
              onTap: context.pop,
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
                  onTap: () => showInfoDialog(context),
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

  void showResult(context, potion) {
    showDialog(
      context: context,
      useSafeArea: false,
      barrierColor: Colors.black.withAlpha(16),
      builder: (context) =>
          WheelResultDialog(onOpen: () => showRecipeDialog(context, potion)),
    );
  }

  void showRecipeDialog(context, potion) {
    showDialog(
      context: context,
      useSafeArea: false,
      barrierColor: Colors.black.withAlpha(16),
      builder: (context) => RecipeDialog(potion: potion),
    );
  }

  void showInfoDialog(context) {
    showDialog(
      context: context,
      useSafeArea: false,
      barrierColor: Colors.black.withAlpha(16),
      builder: (context) => WheelGameInfoDialog(),
    );
  }
}
