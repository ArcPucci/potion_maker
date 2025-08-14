import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:potion_maker/controllers/controllers.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppConfigController>();
    return GestureDetector(
      onTap: () {
        controller.playSound();
        if (onTap != null) {
          onTap?.call();
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Image.asset(
        'assets/png/back.png',
        width: 81.r,
        height: 62.r,
        fit: BoxFit.fill,
      ),
    );
  }
}
