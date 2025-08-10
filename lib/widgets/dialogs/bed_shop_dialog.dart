import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potion_maker/widgets/widgets.dart';

import '../../utils/utils.dart';

class BedShopDialog extends StatelessWidget {
  const BedShopDialog({super.key, required this.price, this.onBuy});

  final int price;
  final VoidCallback? onBuy;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
      child: Material(
        type: MaterialType.transparency,
        child: Center(
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
                            colors: [Color(0xFF01C23B), Color(0xFF00571D)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ).createShader(bounds);
                        },
                        child: Text("BED", style: AppTextStyles.ls36),
                      ),
                    ),
                    Positioned(
                      top: 105.r,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/png/bed.png',
                            width: 127.r,
                            height: 65.r,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(height: 25.r),
                          BudgetBox(budget: price, hasPlus: false),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 2.sp,
                      child: LabeledButton(
                        label: "BUY",
                        onTap: () {
                          onBuy?.call();
                          Navigator.of(context).pop();
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
      ),
    );
  }
}
