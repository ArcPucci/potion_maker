import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeDialog extends StatelessWidget {
  const RecipeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Material(
        type: MaterialType.transparency,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 621.r,
            height: 335.r,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Image.asset(
                    'assets/png/left_hand.png',
                    width: 186.r,
                    height: 317.r,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Image.asset(
                    'assets/png/right_hand.png',
                    width: 186.r,
                    height: 317.r,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Image.asset(
                    'assets/png/books/green_book.png',
                    width: 489.r,
                    height: 273.r,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 6.r,
                  right: 6.r,
                  child: GestureDetector(
                    onTap: Navigator.of(context).pop,
                    child: Image.asset(
                      'assets/png/close.png',
                      width: 43.r,
                      height: 43.r,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
