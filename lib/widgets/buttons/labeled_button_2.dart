import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../../utils/utils.dart';
import '../widgets.dart';

class LabeledButton2 extends StatelessWidget {
  const LabeledButton2({super.key, this.onTap, required this.label});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppConfigController>();
    return GestureDetector(
      onTap: () {
        controller.playSound();
        onTap?.call();
      },
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
            textStyle: AppTextStyles.ls18.copyWith(fontSize: 18.r),
            strokeColor: AppTheme.darkOrange1,
          ),
        ],
      ),
    );
  }
}
