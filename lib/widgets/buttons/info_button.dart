import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({super.key, this.width, this.height, this.onTap});

  final double? width;
  final double? height;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppConfigController>();
    return GestureDetector(
      onTap: () {
        controller.playSound();
        onTap?.call();
      },
      child: Image.asset(
        'assets/png/info.png',
        width: width ?? 60.r,
        height: height ?? 67.r,
        fit: BoxFit.fill,
      ),
    );
  }
}
