import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potion_maker/widgets/widgets.dart';

import '../../repositories/repositories.dart';
import '../../utils/utils.dart';

class ShelfDialog extends StatelessWidget {
  const ShelfDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 83.r),
            child: SizedBox(
              width: 534.r,
              height: 369.r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 475.r,
                    height: 369.r,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          bottom: 0,
                          child: Image.asset(
                            'assets/png/big_shelf.png',
                            width: 475.r,
                            height: 343.r,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          child: CustomBorderedText(
                            text: "Recipes",
                            strokeWidth: 2.sp,
                            strokeColor: AppTheme.green2,
                            textStyle: AppTextStyles.ls40,
                          ),
                        ),
                        Positioned(
                          top: 75.r,
                          left: 53.r,
                          right: 53.r,
                          bottom: 36.r,
                          child: GridView.builder(
                            itemCount: RecipeRepository.potionsList.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisExtent: 85.r,
                                  crossAxisSpacing: 40.r,
                                ),
                            itemBuilder: (context, index) {
                              final potion =
                                  RecipeRepository.potionsList[index];
                              return Column(
                                children: [
                                  RecipeBookCard(
                                    name: potion.name,
                                    asset: potion.bookAsset,
                                  ),
                                  LabeledButton(
                                    label: "OPEN",
                                    width: 55.r,
                                    height: 20.r,
                                    textStyle: AppTextStyles.ls11,
                                    onTap: () =>
                                        showRecipeDialog(context, potion),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 6.h),
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showRecipeDialog(context, potion) {
    showDialog(
      context: context,
      useSafeArea: false,
      barrierColor: Colors.transparent,
      builder: (context) => RecipeDialog(potion: potion),
    );
  }
}
