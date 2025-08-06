import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class RecipeBookCard extends StatelessWidget {
  const RecipeBookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65.r,
      height: 56.r,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            'assets/png/books/root_of_luck.png',
            width: 44.r,
            height: 48.r,
            fit: BoxFit.fill,
          ),
          Positioned(
            bottom: 0,
            child: CustomBorderedText(
              text: "Root of Luck",
              strokeWidth: 2.sp,
              strokeColor: AppTheme.darkOrange2,
              textStyle: AppTextStyles.ls11,
            ),
          ),
        ],
      ),
    );
  }
}
