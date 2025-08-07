import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class LabeledButton3 extends StatelessWidget {
  const LabeledButton3({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/png/buttons/button1.png',
            width: 64.r,
            height: 26.r,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: 48.r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/png/cent.png',
                  width: 16.r,
                  height: 16.r,
                  fit: BoxFit.fill,
                ),
                SizedBox(width: 2.r),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: CustomBorderedText(
                      text: "1000",
                      strokeWidth: 1.sp,
                      strokeColor: AppTheme.darkOrange1,
                      textStyle: AppTextStyles.ls11,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
