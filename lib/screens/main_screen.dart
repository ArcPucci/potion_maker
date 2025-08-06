import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:potion_maker/utils/utils.dart';
import 'package:potion_maker/widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/png/main_bg.png', fit: BoxFit.cover),
          ),
          Positioned(top: 34.h, right: 333.w, child: MagicAnimated()),
          Positioned(left: 327.w, bottom: -9.h, child: AnimatedWoman()),
          Positioned(
            left: 237.w,
            bottom: 30.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedPotion(),
                Positioned(
                  bottom: 27.r,
                  child: LabeledButton(
                    label: 'GAME',
                    textStyle: AppTextStyles.ls20,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 25.h,
            left: 36.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => showInfoDialog(context),
                  child: Image.asset(
                    'assets/png/info.png',
                    width: 60.r,
                    height: 67.r,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: 12.w),
                RecipesButton(width: 70.r, height: 71.r),
              ],
            ),
          ),
          Positioned(
            top: 161.h,
            left: 137.w,
            child: LabeledButton(
              label: "GREENHOUSE",
              textStyle: AppTextStyles.ls16,
              width: 132.r,
              height: 43.r,
              onTap: () => context.go('/garden'),
            ),
          ),
          Positioned(
            top: 96.h,
            right: 107.w,
            child: GestureDetector(
              onTap: () => context.go('/wheel'),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/png/wheel.png',
                    width: 115.r,
                    height: 150.r,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    bottom: 37.r,
                    child: LabeledButton(
                      label: 'LIBRARY',
                      textStyle: AppTextStyles.ls16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 25.h,
            right: 21.w,
            child: Row(
              children: [
                BudgetBox(),
                SizedBox(width: 10.w),
                MenuButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withAlpha(16),
      useSafeArea: false,
      builder: (context) {
        return MainGameInfoDialog();
      },
    );
  }
}
