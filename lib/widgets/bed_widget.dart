import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potion_maker/widgets/buttons/buttons.dart';

class BedWidget extends StatelessWidget {
  const BedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 127.r,
      height: 133.r,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            child: Image.asset(
              'assets/png/bed.png',
              width: 127.r,
              height: 65.r,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 44.r,
            child: Image.asset(
              'assets/png/lock.png',
              width: 27.r,
              height: 34.r,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(bottom: 6.r, child: LabeledButton3()),
        ],
      ),
    );
  }
}
