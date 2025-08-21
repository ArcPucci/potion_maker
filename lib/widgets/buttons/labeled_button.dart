import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:potion_maker/controllers/controllers.dart';
import 'package:potion_maker/widgets/widgets.dart';

import '../../utils/utils.dart';

class LabeledButton extends StatelessWidget {
  const LabeledButton({
    super.key,
    required this.label,
    this.onTap,
    this.textStyle,
    this.width,
    this.height,
    this.strokeColor,
    this.enabled = true,
  });

  final double? width;
  final double? height;
  final String label;
  final Color? strokeColor;
  final VoidCallback? onTap;
  final TextStyle? textStyle;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppConfigController>();
    return GestureDetector(
      onTap: () {
        if (!enabled) return;
        controller.playSound();
        onTap?.call();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/png/buttons/button1.png',
            width: width ?? 120.r,
            height: height ?? 42.r,
            fit: BoxFit.fill,
          ),
          CustomBorderedText(
            text: label,
            strokeWidth: 1.9.sp,
            textStyle: textStyle ?? AppTextStyles.ls24.copyWith(fontSize: 24.r),
            strokeColor: strokeColor ?? AppTheme.darkOrange1,
          ),
        ],
      ),
    );
  }
}
