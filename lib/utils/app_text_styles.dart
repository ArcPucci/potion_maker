import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potion_maker/utils/utils.dart';

class AppTextStyles {
  static const _lo = 'LilitaOne';
  static const _ls = 'LondrinaSolid';

  static final TextStyle lo11 = TextStyle(
    fontFamily: _lo,
    fontSize: 11.r,
    height: 1,
    color: AppTheme.black1.withValues(alpha: 0.8),
  );

  static final TextStyle ls9 = TextStyle(
    fontFamily: _ls,
    fontSize: 24.r,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.09,
    color: Colors.white,
  );
}
