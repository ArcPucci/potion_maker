import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../dialogs/dialogs.dart';

class RecipesButton extends StatelessWidget {
  const RecipesButton({super.key, this.width, this.height, this.onTap});

  final double? width;
  final double? height;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
          return;
        }
        showRecipes(context);
      },
      child: Image.asset(
        'assets/png/recipes.png',
        width: width ?? 80.r,
        height: height ?? 80.r,
        fit: BoxFit.fill,
      ),
    );
  }

  void showRecipes(context) {
    showDialog(
      context: context,
      useSafeArea: false,
      barrierColor: Colors.black.withAlpha(16),
      builder: (context) => ShelfDialog(),
    );
  }
}
