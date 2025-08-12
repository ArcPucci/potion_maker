import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potion_maker/widgets/widgets.dart';

import '../utils/utils.dart';

class TimerBox extends StatelessWidget {
  const TimerBox({super.key, required this.seconds});

  final int seconds;

  @override
  Widget build(BuildContext context) {
    final minutes = seconds ~/ 60;
    final secondsLeft = (seconds % 60).toString().padLeft(2, '0');

    final time = "$minutes:$secondsLeft";

    return SizedBox(
      width: 84.r,
      height: 35.r,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              width: 74.r,
              height: 28.r,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/png/timer_bg.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: CustomBorderedText(
                text: time,
                strokeWidth: 1.sp,
                textStyle: AppTextStyles.ls20.copyWith(letterSpacing: 0),
                strokeColor: AppTheme.darkOrange1,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/png/clock.png',
              width: 24.r,
              height: 25.r,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
