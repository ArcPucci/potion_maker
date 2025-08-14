import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:potion_maker/models/models.dart';
import 'package:potion_maker/widgets/custom_bordered_text.dart';

import '../../utils/utils.dart';
import '../buttons/buttons.dart';

class RecipeDialog extends StatefulWidget {
  const RecipeDialog({super.key, required this.potion});

  final Potion potion;

  @override
  State<RecipeDialog> createState() => _RecipeDialogState();
}

class _RecipeDialogState extends State<RecipeDialog> {
  final list = [(49.r, 271.r), (48.r, 359.r), (136.r, 268.r), (145.r, 354.r)];

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Material(
        type: MaterialType.transparency,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 621.r,
            height: 335.r,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Image.asset(
                    'assets/png/left_hand.png',
                    width: 186.r,
                    height: 317.r,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Image.asset(
                    'assets/png/right_hand.png',
                    width: 186.r,
                    height: 317.r,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        _getBookAsset(widget.potion.type),
                        width: 489.r,
                        height: 273.r,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        top: 36.r,
                        left: 75.r,
                        child: SizedBox(
                          width: 150.r,
                          child: Column(
                            children: [
                              Transform.rotate(
                                angle: (4 * pi) / 180,
                                child: CustomBorderedText(
                                  text: widget.potion.name,
                                  strokeWidth: 2.sp,
                                  strokeColor: AppTheme.green2,
                                  textStyle: AppTextStyles.ls24.copyWith(
                                    letterSpacing: 0,
                                    fontSize: 24.r,
                                  ),
                                ),
                              ),
                              Transform.rotate(
                                angle: (widget.potion.angle * pi) / 180,
                                child: Image.asset(
                                  widget.potion.asset,
                                  width: 81.r,
                                  height: 115.r,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ...List.generate(widget.potion.recipe.length, (index) {
                        final ingredient = widget.potion.recipe[index];
                        return Positioned(
                          top: list[index].$1,
                          left: list[index].$2,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 17.r,
                                height: 17.r,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppTheme.blue1,
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
                                child: Text(
                                  "${index + 1}",
                                  style: AppTextStyles.lo15.copyWith(
                                    fontSize: 15.r,
                                  ),
                                ),
                              ),
                              SizedBox(width: 14.r),
                              _buildIngredient(ingredient),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                Positioned(
                  top: 6.r,
                  right: 6.r,
                  child: CustomCloseButton(onTap: Navigator.of(context).pop),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getBookAsset(PotionType type) => switch (type) {
    PotionType.normal => 'assets/png/books/green_book.png',
    PotionType.common => 'assets/png/books/red_book.png',
    PotionType.rare => 'assets/png/books/purple_book.png',
    PotionType.veryRare => 'assets/png/books/blue_book.png',
  };

  Widget _buildIngredient(ingredient) {
    if (ingredient is Flower) {
      return Image.asset(
        ingredient.asset,
        width: 37.r,
        height: 53.r,
        fit: BoxFit.fill,
      );
    } else if (ingredient is StoneCup) {
      return Image.asset(
        ingredient.asset,
        width: 43.r,
        height: 46.r,
        fit: BoxFit.fill,
      );
    } else if (ingredient is WhiteCrystal) {
      return Image.asset(
        ingredient.asset,
        width: 28.r,
        height: 28.r,
        fit: BoxFit.fill,
      );
    } else {
      return Image.asset(
        ingredient.asset,
        width: 30.r,
        height: 35.r,
        fit: BoxFit.fill,
      );
    }
  }
}
