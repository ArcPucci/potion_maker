import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';
import 'buttons/buttons.dart';

class StoneCupWidget extends StatelessWidget {
  const StoneCupWidget({super.key, this.onGrind, this.hasButton = false});

  final bool hasButton;
  final VoidCallback? onGrind;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 112.r,
      height: 149.r,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Image.asset(
              'assets/png/big_stone_cup.png',
              width: 100.r * 1.1,
              height: 120.r * 1.1,
              fit: BoxFit.fill,
            ),
          ),
          if (hasButton)
            Positioned(
              bottom: 0,
              child: LabeledButton(
                label: "TO GRIND",
                textStyle: AppTextStyles.ls20.copyWith(fontSize: 20.r),
                onTap: onGrind,
              ),
            ),
        ],
      ),
    );
  }
}
