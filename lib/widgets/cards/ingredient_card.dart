import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:potion_maker/models/models.dart';

import '../../utils/utils.dart';

class IngredientCard extends StatelessWidget {
  const IngredientCard({
    super.key,
    required this.index,
    this.ingredientModel,
    required this.onAccept,
    this.active = true,
    this.empty = false,
  });

  final int index;
  final bool active;
  final bool empty;
  final IngredientModel? ingredientModel;
  final void Function(Ingredient) onAccept;

  @override
  Widget build(BuildContext context) {
    return empty
        ? SizedBox(width: 64.r)
        : SizedBox(
            width: 64.r,
            height: 64.r,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 17.r,
                    height: 17.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.blue1,
                      border: GradientBoxBorder(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF01C28B), Color(0xFF00573F)],
                        ),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text("${index + 1}", style: AppTextStyles.lo15),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 8.r,
                  child: DragTarget<Ingredient>(
                    onAcceptWithDetails: (details) {
                      if (!active) return;
                      onAccept.call(details.data);
                    },
                    builder: (context, candidateData, rejectedData) {
                      return Opacity(
                        opacity: active ? 1 : 0.5,
                        child: Container(
                          width: 53.r,
                          height: 53.r,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/png/circle_bg.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: _buildIngredient(),
                        ),
                      );
                    },
                  ),
                ),
                if (ingredientModel != null && ingredientModel?.correct != null)
                  Positioned(
                    left: 28.r,
                    bottom: 0,
                    child: Image.asset(
                      ingredientModel!.correct!
                          ? 'assets/png/correct.png'
                          : 'assets/png/wrong.png',
                      width: 20.r,
                      height: 20.r,
                      fit: BoxFit.fill,
                    ),
                  ),
              ],
            ),
          );
  }

  Widget _buildIngredient() {
    final ingredient = ingredientModel?.ingredient;
    if (ingredient is Flower) {
      return Image.asset(
        ingredient.asset,
        width: 24.r,
        height: 35.r,
        alignment: Alignment.topCenter,
        fit: BoxFit.cover,
      );
    } else if (ingredient is Crystal) {
      if (ingredient is WhiteCrystal) {
        return Image.asset(
          ingredient.asset,
          width: 15.r,
          height: 15.r,
          fit: BoxFit.fill,
        );
      }
      return Image.asset(
        ingredient.asset,
        width: 30.r,
        height: 35.r,
        fit: BoxFit.fill,
      );
    }
    return SizedBox();
  }
}
