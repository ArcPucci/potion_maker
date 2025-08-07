import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class RecipeBookCard extends StatelessWidget {
  const RecipeBookCard({super.key, required this.name, required this.asset});

  final String name;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65.r,
      height: 56.r,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(asset, width: 44.r, height: 48.r, fit: BoxFit.fill),
          Positioned(
            bottom: 0,
            child: CustomBorderedText(
              text: name,
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
