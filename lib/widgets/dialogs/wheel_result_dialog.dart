import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potion_maker/widgets/widgets.dart';

import '../../utils/utils.dart';

class WheelResultDialog extends StatelessWidget {
  const WheelResultDialog({super.key, this.onOpen});

  final VoidCallback? onOpen;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 30.r),
            child: SizedBox(
              width: 264.r,
              height: 255.r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 213.r,
                    height: 255.r,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          bottom: 0,
                          child: Image.asset(
                            'assets/png/letter_bg_2.png',
                            width: 213.r,
                            height: 230.r,
                            fit: BoxFit.fill,
                          ),
                        ),
                        ..._getPositions(context, true),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: GestureDetector(
                      onTap: Navigator.of(context).pop,
                      child: Image.asset(
                        'assets/png/close.png',
                        width: 43.r,
                        height: 43.r,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Positioned> _getPositions(context, bool won) {
    if (won) {
      return [
        Positioned(
          top: 0,
          child: Image.asset(
            'assets/png/you_win.png',
            width: 105.r,
            height: 82.r,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 111.r,
          child: RecipeBookCard(
            name: '',
            asset: 'assets/png/books/root_of_luck.png',
          ),
        ),
        Positioned(
          bottom: 0,
          child: LabeledButton(
            label: "OPEN",
            onTap: () {
              Navigator.of(context).pop();
              onOpen?.call();
            },
          ),
        ),
      ];
    }
    return [
      Positioned(
        top: 0,
        child: Image.asset(
          'assets/png/you_lose.png',
          width: 105.r,
          height: 82.r,
          fit: BoxFit.fill,
        ),
      ),
      Positioned(
        top: 111.r,
        child: Column(
          children: [
            Text(
              "Unfortunately, you lost.\nPlease try again.".toUpperCase(),
              style: AppTextStyles.ls12,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 11.h),
            BudgetBox(hasPlus: false, budget: -100),
          ],
        ),
      ),
    ];
  }
}
