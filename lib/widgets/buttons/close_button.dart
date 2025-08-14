import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({super.key, this.onTap});

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
        'assets/png/close.png',
        width: 43.r,
        height: 43.r,
        fit: BoxFit.fill,
      ),
    );
  }
}
