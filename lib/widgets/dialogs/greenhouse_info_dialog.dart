import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';

class GreenhouseInfoDialog extends StatefulWidget {
  const GreenhouseInfoDialog({super.key});

  @override
  State<GreenhouseInfoDialog> createState() => _GreenhouseInfoDialogState();
}

class _GreenhouseInfoDialogState extends State<GreenhouseInfoDialog> {
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
                                  "You are in the greenhouse of magical plants—a place where magic is born. In this section, you will grow many wonderful plants needed for potion-making. Without them, even the rarest and most valuable recipes will remain useless."
                                      .toUpperCase(),
                                  style: AppTextStyles.pp10_600.copyWith(
                                    fontSize: 10.r,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  "To replenish your stock of magical herbs, start by planting seeds. You can purchase seeds for coins in the shop. If you're short on coins, you can always buy them there as well."
                                      .toUpperCase(),
                                  style: AppTextStyles.pp10_600.copyWith(
                                    fontSize: 10.r,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                SizedBox(
                                  width: 276.r,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'assets/png/info_image_7.png',
                                        width: 152.r,
                                        height: 97.r,
                                        fit: BoxFit.fill,
                                      ),
                                      Image.asset(
                                        'assets/png/info_image_8.png',
                                        width: 124.r,
                                        height: 97.r,
                                        fit: BoxFit.fill,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 17.h),
                                Text(
                                  "Before planting, you need to make sure you have an available plot for the seeds. If you don't have one, you need to buy a free plot and click the plant button, after which you can choose which specific plant you want to plant."
                                      .toUpperCase(),
                                  style: AppTextStyles.pp10_600.copyWith(
                                    fontSize: 10.r,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  "After purchasing the seeds, you need to plant them in the soil and wait for 10 minutes."
                                      .toUpperCase(),
                                  style: AppTextStyles.pp10_600.copyWith(
                                    fontSize: 10.r,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                SizedBox(
                                  width: 276.r,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'assets/png/info_image_9.png',
                                        width: 135.r,
                                        height: 98.r,
                                        fit: BoxFit.fill,
                                      ),
                                      Image.asset(
                                        'assets/png/info_image_10.png',
                                        width: 135.r,
                                        height: 98.r,
                                        fit: BoxFit.fill,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 24.h),
                                Text(
                                  "After purchasing the seeds, you need to plant them in the soil and wait for 10 minutes."
                                      .toUpperCase(),
                                  style: AppTextStyles.pp10_600.copyWith(
                                    fontSize: 10.r,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Image.asset(
                                  'assets/png/info_image_11.png',
                                  width: 190.r,
                                  height: 104.r,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(height: 21.h),
                                Text(
                                  "Once the timer ends, the magical plant will be available for use—it will appear in the main game and in your inventory list. With it, you will be able to create even more diverse potions from your magical library."
                                      .toUpperCase(),
                                  style: AppTextStyles.pp10_600.copyWith(
                                    fontSize: 10.r,
                                  ),
                                ),
                                SizedBox(height: 13.h),
                                Image.asset(
                                  'assets/png/info_image_12.png',
                                  width: 243.r,
                                  height: 91.r,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(height: 3.h),
                                Image.asset(
                                  'assets/png/info_image_13.png',
                                  width: 243.r,
                                  height: 143.r,
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
                  GestureDetector(
                    onTap: Navigator.of(context).pop,
                    child: Image.asset(
                      'assets/png/close.png',
                      width: 43.r,
                      height: 43.r,
                      fit: BoxFit.fill,
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
}
