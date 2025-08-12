import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potion_maker/models/models.dart';
import 'package:potion_maker/utils/utils.dart';

import '../widgets.dart';

class CrystalCard extends StatelessWidget {
  const CrystalCard({
    super.key,
    required this.crystal,
    this.canDrag = true,
    this.locked = false,
    this.onBuy,
  });

  final bool canDrag;
  final bool locked;
  final CrystalModel crystal;
  final VoidCallback? onBuy;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 43.r,
      height: crystal.height + 10.r,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          if (canDrag && !locked)
            Draggable<Ingredient>(
              data: crystal.crystal,
              feedback: Image.asset(
                crystal.crystal.assetCup,
                width: crystal.width,
                height: crystal.height,
                fit: BoxFit.fill,
              ),
              child: Image.asset(
                crystal.crystal.assetCup,
                width: crystal.width,
                height: crystal.height,
                fit: BoxFit.fill,
              ),
            )
          else
            Opacity(
              opacity: locked ? 0.5 : 1,
              child: Image.asset(
                crystal.crystal.assetCup,
                width: crystal.width,
                height: crystal.height,
                fit: BoxFit.fill,
              ),
            ),
          if (locked)
            Positioned(
              bottom: 0,
              child: GestureDetector(
                onTap: onBuy,
                child: SizedBox(
                  width: 43.r,
                  height: 18.r,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 38.r,
                          height: 17.r,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/png/buttons/button1.png'),
                              fit: BoxFit.fill,
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 1),
                                blurRadius: 2,
                                color: Colors.black.withValues(alpha: 0.25),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: CustomBorderedText(
                            text: "${crystal.crystal.price}",
                            strokeWidth: 1.sp,
                            textStyle: AppTextStyles.ls10.copyWith(
                              fontSize: 10.r,
                            ),
                            strokeColor: AppTheme.darkOrange1,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Image.asset(
                          'assets/png/cent.png',
                          width: 14.r,
                          height: 14.r,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
