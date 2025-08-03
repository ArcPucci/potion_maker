import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class LabeledButton2 extends StatelessWidget {
  const LabeledButton2({super.key, this.onTap, required this.label});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/png/buttons/button2.png',
            width: 72.r,
            height: 54.r,
            fit: BoxFit.fill,
          ),
          CustomBorderedText(
            text: label,
            strokeWidth: 1.9.sp,
            textStyle: AppTextStyles.ls18,
            strokeColor: AppTheme.darkOrange1,
          ),
        ],
      ),
    );
  }
}
