import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:potion_maker/controllers/controllers.dart';
import 'package:potion_maker/models/models.dart';
import 'package:potion_maker/widgets/widgets.dart';

import '../../utils/utils.dart';

class CrystalDialog extends StatelessWidget {
  const CrystalDialog({super.key, required this.crystalModel});

  final CrystalModel crystalModel;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PotionMakerController>();
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: SizedBox(
            width: 342.r,
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
                                  crystalModel.crystal.name,
                                  style: AppTextStyles.ls36.copyWith(
                                    fontSize: 36.r,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 90.r,
                              child: Column(
                                children: [
                                  Image.asset(
                                    crystalModel.crystal.assetCup,
                                    width: 76.r,
                                    height: 88.r,
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(height: 18.r),
                                  BudgetBox(
                                    budget: crystalModel.crystal.price,
                                    hasSymbol: false,
                                    hasPlus: false,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 5.r,
                              child: Opacity(
                                opacity:
                                    controller.coins >=
                                        crystalModel.crystal.price
                                    ? 1
                                    : 0.5,
                                child: LabeledButton(
                                  label: "BUY",
                                  onTap: () {
                                    if (controller.coins >=
                                        crystalModel.crystal.price) {
                                      controller.buyCrystal(
                                        crystalModel.crystal,
                                      );
                                      Navigator.of(context).pop();
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
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
                Positioned(
                  top: 0,
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
        ),
      ),
    );
  }
}
