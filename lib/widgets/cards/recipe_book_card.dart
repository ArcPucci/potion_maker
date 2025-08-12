import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class RecipeBookCard extends StatelessWidget {
  const RecipeBookCard({
    super.key,
    required this.name,
    required this.asset,
    this.isAvailable = true,
  });

  final String name;
  final String asset;
  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65.r,
      height: 56.r,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Opacity(
            opacity: isAvailable ? 1 : 0.5,
            child: Image.asset(
              asset,
              width: 44.r,
              height: 48.r,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Opacity(
              opacity: isAvailable ? 1 : 0.5,
              child: CustomBorderedText(
                text: name,
                strokeWidth: 2.sp,
                strokeColor: AppTheme.darkOrange2,
                textStyle: AppTextStyles.ls11.copyWith(fontSize: 11.r),
              ),
            ),
          ),
          if (!isAvailable)
            Padding(
              padding: EdgeInsets.only(top: 7.r),
              child: Image.asset(
                'assets/png/lock.png',
                width: 27.r,
                height: 34.r,
                fit: BoxFit.fill,
              ),
            ),
        ],
      ),
    );
  }
}
