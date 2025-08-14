import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:potion_maker/utils/utils.dart';
import 'package:potion_maker/widgets/buttons/buttons.dart';

class LeaveDialog extends StatelessWidget {
  const LeaveDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: SizedBox(
            width: 290.r,
            height: 340.r,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 290.r,
                        height: 313.r,
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
                              top: 16.r,
                              child: Image.asset(
                                'assets/png/exit.png',
                                width: 110.r,
                                height: 50.r,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              top: 126.r,
                              child: SizedBox(
                                width: 200.r,
                                child: Text(
                                  "Are you sure you want to exit?\nIf you exit now, all earned coins will be lost and the gameplay will reset today."
                                      .toUpperCase(),
                                  style: AppTextStyles.ls14.copyWith(
                                    fontSize: 14.r,
                                    color: Color(0xFF512800),
                                    letterSpacing: 0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 22.r,
                              right: 16.r,
                              bottom: 16.r,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  LabeledButton(
                                    label: "EXIT",
                                    strokeColor: Colors.white,
                                    textStyle: AppTextStyles.ls24.copyWith(
                                      color: Color(0xFFFF0000),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      Get.back();
                                    },
                                  ),
                                  LabeledButton(
                                    label: "CONTINUE",
                                    textStyle: AppTextStyles.ls20,
                                    onTap: Navigator.of(context).pop,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.r),
                    child: Image.asset(
                      'assets/png/paused.png',
                      width: 84.r,
                      height: 35.r,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
