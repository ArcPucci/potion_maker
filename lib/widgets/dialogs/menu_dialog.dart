import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:potion_maker/controllers/controllers.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class MenuDialog extends StatelessWidget {
  const MenuDialog({super.key, this.paused = false});

  final bool paused;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
      child: Material(
        type: MaterialType.transparency,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.r),
              child: SizedBox(
                width: 342.r,
                height: 338.r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/png/letter_bg_2.png',
                          width: 290.r,
                          height: 313.r,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          top: 10.r,
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                colors: [
                                  Color(0xFF01C23B),
                                  Color(0xFF00571D),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ).createShader(bounds);
                            },
                            child: Text(
                              "MENU",
                              style: AppTextStyles.ls36.copyWith(
                                fontSize: 36.r,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 92.h,
                          child: GetBuilder<AppConfigController>(
                            builder: (controller) {
                              return Column(
                                children: [
                                  CustomBorderedText(
                                    text: "MUSIC",
                                    strokeWidth: 2.sp,
                                    strokeColor: AppTheme.darkOrange1,
                                    textStyle: AppTextStyles.ls16.copyWith(
                                      letterSpacing: 0,
                                      fontSize: 16.r,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  CustomSwitchBox(
                                    initialValue: controller.musicValue.value,
                                    onChanged: controller.toggleMusic,
                                  ),
                                  SizedBox(height: 23.h),
                                  CustomBorderedText(
                                    text: "SOUNDS",
                                    strokeWidth: 2.sp,
                                    strokeColor: AppTheme.darkOrange1,
                                    textStyle: AppTextStyles.ls16.copyWith(
                                      letterSpacing: 0,
                                      fontSize: 16.r,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  CustomSwitchBox(
                                    initialValue: controller.soundValue.value,
                                    onChanged: controller.toggleSound,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
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
            if (paused)
              Positioned(
                top: 21.r,
                child: Padding(
                  padding: EdgeInsets.only(right: 50.r),
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
    );
  }
}
