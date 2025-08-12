import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:potion_maker/utils/utils.dart';
import 'package:potion_maker/widgets/widgets.dart';

import '../../controllers/controllers.dart';

class PotionMakerResultDialog extends StatelessWidget {
  const PotionMakerResultDialog({
    super.key,
    this.won,
    required this.correct,
    required this.wrong,
    required this.sum,
  });

  final bool? won;
  final int correct;
  final int wrong;
  final int sum;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PotionMakerController>();
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: SizedBox(
            width: 290.r,
            height: 321.r,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 0,
                  child: Image.asset(
                    'assets/png/letter_bg_2.png',
                    width: 290.r,
                    height: 313.r,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 101.r,
                  child: Column(
                    children: [
                      BudgetBox(budget: sum, hasPlus: false, hasSymbol: true),
                      SizedBox(height: 31.r),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (won == null || (won != null && !won!))
                            _SquareCounter(count: wrong, correct: false),
                          if (won == null) SizedBox(width: 24.r),
                          if (won == null || (won != null && won!))
                            _SquareCounter(count: correct, correct: true),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 7.r,
                  right: 12.r,
                  bottom: 10.r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LabeledButton(
                        label: "PLAY AGAIN",
                        width: 133.r,
                        textStyle: AppTextStyles.ls20.copyWith(fontSize: 20.r),
                        onTap: () {
                          Navigator.of(context).pop();
                          controller.playAgain();
                        },
                      ),
                      LabeledButton(label: "MENU", onTap: () {
                        Navigator.of(context).pop();
                        controller.onTapMenu();
                      }),
                    ],
                  ),
                ),
                _getTitle(context, won),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Positioned _getTitle(context, bool? won) {
    if (won == null) {
      return Positioned(
        top: 0,
        child: Image.asset(
          'assets/png/time_is_up.png',
          width: 147.r,
          height: 91.r,
          fit: BoxFit.fill,
        ),
      );
    }
    if (won) {
      return Positioned(
        top: 0,
        child: Image.asset(
          'assets/png/you_win.png',
          width: 105.r,
          height: 82.r,
          fit: BoxFit.fill,
        ),
      );
    }
    return Positioned(
      top: 0,
      child: Image.asset(
        'assets/png/you_lose.png',
        width: 105.r,
        height: 82.r,
        fit: BoxFit.fill,
      ),
    );
  }
}

class _SquareCounter extends StatelessWidget {
  const _SquareCounter({super.key, required this.count, this.correct = true});

  final int count;
  final bool correct;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64.r,
      height: 64.r,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/png/paper_square.png',
                  width: 56.r,
                  height: 56.r,
                  fit: BoxFit.fill,
                ),
                Text(
                  "$count",
                  style: AppTextStyles.ls36.copyWith(fontSize: 36.r),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              correct ? 'assets/png/correct.png' : 'assets/png/wrong.png',
              width: 20.r,
              height: 20.r,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
