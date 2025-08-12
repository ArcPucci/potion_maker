import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:potion_maker/controllers/controllers.dart';
import 'package:potion_maker/repositories/repositories.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class SeedStoreDialog extends StatelessWidget {
  const SeedStoreDialog({super.key});

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
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/png/letter_bg_3.png',
                          width: 440.r,
                          height: 313.r,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          left: 82.r,
                          right: 82.r,
                          child: GetBuilder<GreenhouseController>(
                            builder: (controller) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  GreenhouseRepository.shopFlowers.length,
                                  (index) {
                                    final flower =
                                        GreenhouseRepository.shopFlowers[index];
                                    final isBought = controller.availableFlowers
                                        .contains(flower.asset);
                                    final canBuy =
                                        controller.coins >= flower.price;
                                    return Column(
                                      children: [
                                        Container(
                                          width: 75.r,
                                          height: 75.r,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            color: AppTheme.green2.withAlpha(
                                              21,
                                            ),
                                            border: GradientBoxBorder(
                                              gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xFF01C28B),
                                                  Color(0xFF00573F),
                                                ],
                                              ),
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            flower.asset,
                                            width: 40.r,
                                            height: 53.r,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.topCenter,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        isBought
                                            ? SizedBox(height: 29.r)
                                            : Opacity(
                                                opacity: canBuy ? 1 : 0.5,
                                                child: SizedBox(
                                                  width: 69.r,
                                                  height: 29.r,
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Positioned(
                                                        right: 0,
                                                        child: LabeledButton(
                                                          label: flower.price
                                                              .toString(),
                                                          width: 62.r,
                                                          height: 29.r,
                                                          textStyle:
                                                              AppTextStyles.ls14
                                                                  .copyWith(
                                                                    fontSize:
                                                                        14.r,
                                                                  ),
                                                          onTap: () {
                                                            if (isBought)
                                                              return;
                                                            controller
                                                                .buyFlower(
                                                                  flower,
                                                                );
                                                          },
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 0,
                                                        child: Image.asset(
                                                          'assets/png/cent.png',
                                                          width: 23.r,
                                                          height: 23.r,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                      ],
                                    );
                                  },
                                ),
                              );
                            },
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
