import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potion_maker/utils/utils.dart';

class AppTextStyles {
  static const _lo = 'LilitaOne';
  static const _ls = 'LondrinaSolid';
  static const _pp = 'Poppins';

  static final TextStyle lo11 = TextStyle(
    fontFamily: _lo,
    fontSize: 11.r,
    height: 1,
    color: AppTheme.black1.withValues(alpha: 0.8),
  );

  static final TextStyle lo15 = TextStyle(
    fontFamily: _lo,
    fontSize: 15.r,
    height: 1,
    color: Colors.white,
  );

  static final TextStyle ls10 = TextStyle(
    fontFamily: _ls,
    fontSize: 10.r,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static final TextStyle ls11 = TextStyle(
    fontFamily: _ls,
    fontSize: 11.r,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static final TextStyle ls12 = TextStyle(
    fontFamily: _ls,
    fontSize: 12.r,
    letterSpacing: 1.2,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static final TextStyle ls14 = TextStyle(
    fontFamily: _ls,
    fontSize: 14.r,
    fontWeight: FontWeight.w400,
    letterSpacing: 2,
    color: Colors.white,
  );

  static final TextStyle ls16 = TextStyle(
    fontFamily: _ls,
    fontSize: 16.r,
    fontWeight: FontWeight.w400,
    letterSpacing: 2,
    color: Colors.white,
  );

  static final TextStyle ls17 = TextStyle(
    fontFamily: _ls,
    fontSize: 17.r,
    fontWeight: FontWeight.w400,
    letterSpacing: 2,
    color: Colors.white,
  );

  static final TextStyle ls18 = TextStyle(
    fontFamily: _ls,
    fontSize: 18.r,
    fontWeight: FontWeight.w400,
    letterSpacing: 2,
    color: Colors.white,
  );

  static final TextStyle ls20 = TextStyle(
    fontFamily: _ls,
    fontSize: 20.r,
    fontWeight: FontWeight.w400,
    letterSpacing: 2,
    color: Colors.white,
  );

  static final TextStyle ls24 = TextStyle(
    fontFamily: _ls,
    fontSize: 24.r,
    fontWeight: FontWeight.w400,
    letterSpacing: 2,
    color: Colors.white,
  );

  static final TextStyle ls36 = TextStyle(
    fontFamily: _ls,
    fontSize: 36.r,
    fontWeight: FontWeight.w400,
    letterSpacing: 2,
    color: Colors.white,
    shadows: [
      BoxShadow(
        offset: Offset(0, 2),
        blurRadius: 4,
        color: Colors.black.withValues(alpha: 0.25),
      ),
    ],
  );

  static final TextStyle ls40 = TextStyle(
    fontFamily: _ls,
    fontSize: 40.r,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static final TextStyle pp10_600 = TextStyle(
    fontFamily: _pp,
    fontSize: 10.r,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.9,
    color: Colors.black,
  );
}
