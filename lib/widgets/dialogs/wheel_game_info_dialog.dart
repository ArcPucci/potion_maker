import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../buttons/buttons.dart';

class WheelGameInfoDialog extends StatefulWidget {
  const WheelGameInfoDialog({super.key});

  @override
  State<WheelGameInfoDialog> createState() => _WheelGameInfoDialogState();
}

class _WheelGameInfoDialogState extends State<WheelGameInfoDialog> {
  final controller = ScrollController();
  static final double _thumbHeight = 20.r;
  double _thumbPosition = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(_updateThumbPosition);
  }

  void _updateThumbPosition() {
    double maxScrollExtent = controller.position.maxScrollExtent;
    double viewHeight = controller.position.viewportDimension - 10.r;

    if (maxScrollExtent > 0) {
      setState(() {
        _thumbPosition =
            (controller.offset / maxScrollExtent) * (viewHeight - _thumbHeight);
      });
    }
  }

  @override
  void dispose() {
    controller.removeListener(_updateThumbPosition);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: SizedBox(
              width: 492.r,
              height: 335.r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/png/letter_bg_3.png',
                          width: 440.r,
                          height: 313.r,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          top: 77.r,
                          left: 78.r,
                          right: 68.r,
                          bottom: 65.r,
                          child: SingleChildScrollView(
                            controller: controller,
                            child: Column(
                              children: [
                                Text(
                                  "You are in the Knowledge Wheel section, where you can win rare books by spinning the Knowledge Wheel, but first, you need to place a bet to spin."
                                      .toUpperCase(),
                                  style: AppTextStyles.pp10_600.copyWith(
                                    fontSize: 10.r,
                                  ),
                                ),
                                SizedBox(height: 29.h),
                                Text(
                                  "At the bottom of the screen, there are betting buttons. Select the number of coins you are willing to spend to place a bet and press the Spin button. If you want to take a risk, you can bet the entire amount of coins by pressing the Max Bet button."
                                      .toUpperCase(),
                                  style: AppTextStyles.pp10_600.copyWith(
                                    fontSize: 10.r,
                                  ),
                                ),
                                SizedBox(height: 22.h),
                                Image.asset(
                                  'assets/png/info_image_4.png',
                                  width: 219.r,
                                  height: 50.r,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(height: 22.h),
                                Text(
                                  "After pressing one of the buttons listed above, the wheel will spin and stop on a random book, which will be your prize. The book can be either rare or common, and there are also spaces on the wheel that are empty; if you land on one of those, your bet will be forfeited."
                                      .toUpperCase(),
                                  style: AppTextStyles.pp10_600.copyWith(
                                    fontSize: 10.r,
                                  ),
                                ),
                                SizedBox(height: 20.h),

                                Image.asset(
                                  'assets/png/info_image_5.png',
                                  width: 211.r,
                                  height: 209.r,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(height: 28.h),
                                Text(
                                  "If you have won a new recipe, it will immediately appear on the bookshelf and in the recipe book, and a new potion order will also appear in the main game."
                                      .toUpperCase(),
                                  style: AppTextStyles.pp10_600.copyWith(
                                    fontSize: 10.r,
                                  ),
                                ),
                                SizedBox(height: 17.h),
                                Image.asset(
                                  'assets/png/info_image_6.png',
                                  width: 283.r,
                                  height: 176.r,
                                  fit: BoxFit.fill,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 77.r + _thumbPosition,
                          right: 63.r,
                          child: Container(
                            width: 5.sp,
                            height: 20.sp,
                            decoration: BoxDecoration(
                              color: Color(0xFF01C28B),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10.r,
                          left: 197.r,
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                colors: [Color(0xFF01C23B), Color(0xFF00571D)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ).createShader(bounds);
                            },
                            child: Text(
                              "INFO",
                              style: AppTextStyles.ls36.copyWith(
                                fontSize: 36.r,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomCloseButton(onTap: Navigator.of(context).pop),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
