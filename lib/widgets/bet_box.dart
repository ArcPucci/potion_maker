import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';
import 'custom_bordered_text.dart';

class BetBox extends StatelessWidget {
  const BetBox({
    super.key,
    required this.bet,
    this.onIncrease,
    this.onDecrease,
  });

  final int bet;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 109.r,
      height: 43.r,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/png/wood_bg_2.png'),
          fit: BoxFit.fill,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: Offset(0, 4),
            color: Colors.black.withAlpha(25),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.r),
      child: Row(
        children: [
          GestureDetector(
            onTap: onDecrease,
            child: Image.asset(
              'assets/png/decrease.png',
              width: 11.r,
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: CustomBorderedText(
                text: '$bet',
                strokeWidth: 1.sp,
                strokeColor: AppTheme.darkOrange2,
                textStyle: AppTextStyles.ls18,
              ),
            ),
          ),
          GestureDetector(
            onTap: onIncrease,
            child: Image.asset(
              'assets/png/increase.png',
              width: 13.r,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
