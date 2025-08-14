import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../controllers/controllers.dart';
import '../../repositories/repositories.dart';
import '../../utils/utils.dart';
import '../buttons/buttons.dart';

class SeedsDialog extends StatelessWidget {
  const SeedsDialog({super.key});

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
                    child: GetBuilder<GreenhouseController>(
                      builder: (controller) {
                        final hasAvailableFlowers =
                            controller.availableFlowers.length > 3;
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/png/letter_bg_3.png',
                              width: 440.r,
                              height: 313.r,
                              fit: BoxFit.fill,
                            ),
                            if (!hasAvailableFlowers)
                              Text(
                                "After purchasing seeds from\nthe store, they will appear in\nthis section."
                                    .toUpperCase(),
                                textAlign: TextAlign.center,
                                style: AppTextStyles.ls16.copyWith(
                                  color: Color(0xFF6C2800),
                                  fontSize: 16.r,
                                ),
                              ),
                            if (hasAvailableFlowers)
                              Positioned(
                                left: 82.r,
                                right: 82.r,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                    GreenhouseRepository.shopFlowers.length,
                                    (index) {
                                      final flower = GreenhouseRepository
                                          .shopFlowers[index];
                                      final isBought = controller
                                          .availableFlowers
                                          .contains(flower.asset);
                                      final riped = controller.ripedFlowers
                                          .contains(flower.asset);
                                      return Column(
                                        children: [
                                          Container(
                                            width: 75.r,
                                            height: 75.r,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
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
                                          Opacity(
                                            opacity: (isBought && !riped)
                                                ? 1
                                                : 0.5,
                                            child: LabeledButton(
                                              label: isBought
                                                  ? !riped
                                                        ? "TO PLANT"
                                                        : "PlANTED"
                                                  : "BUY",
                                              width: 71.r,
                                              height: 29.r,
                                              textStyle: AppTextStyles.ls14
                                                  .copyWith(fontSize: 14.r),
                                              onTap: () {
                                                if (!isBought || riped) {
                                                  return;
                                                }
                                                controller.plantFlower(flower);
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
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
                                  "SEEDS",
                                  style: AppTextStyles.ls36.copyWith(
                                    fontSize: 36.r,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
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
