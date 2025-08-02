import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potion_maker/widgets/widgets.dart';

import '../../utils/utils.dart';

class LabeledButton extends StatelessWidget {
  const LabeledButton({super.key, required this.label, this.onTap});

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
            'assets/png/buttons/button1.png',
            width: 120.r,
            height: 42.r,
            fit: BoxFit.fill,
          ),
          CustomBorderedText(
            text: label,
            strokeWidth: 0.9.sp,
            textStyle: AppTextStyles.ls9,
            strokeColor: AppTheme.darkOrange1,
          ),
        ],
      ),
    );
  }
}
