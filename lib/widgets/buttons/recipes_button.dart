import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../dialogs/dialogs.dart';

class RecipesButton extends StatelessWidget {
  const RecipesButton({
    super.key,
    this.width,
    this.height,
    this.onTap,
    this.onOpen,
    this.onClose,
  });

  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final VoidCallback? onOpen;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppConfigController>();
    return GestureDetector(
      onTap: () async {
        controller.playSound();
        if (onTap != null) {
          onTap!();
          return;
        }
        onOpen?.call();
        await showRecipes(context);
        onClose?.call();
      },
      child: Image.asset(
        'assets/png/recipes.png',
        width: width ?? 80.r,
        height: height ?? 80.r,
        fit: BoxFit.fill,
      ),
    );
  }

  Future<void> showRecipes(context) async {
    await showDialog(
      context: context,
      useSafeArea: false,
      barrierColor: Colors.black.withAlpha(16),
      builder: (context) => ShelfDialog(),
    );
  }
}
