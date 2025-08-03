import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../utils/utils.dart';
import '../buttons/buttons.dart';

class CoinCard extends StatelessWidget {
  const CoinCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 75.r,
          height: 75.r,
          decoration: BoxDecoration(
            color: AppTheme.green2.withAlpha(21),
            borderRadius: BorderRadius.circular(12),
            border: GradientBoxBorder(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF01C28B), Color(0xFF00573F)],
              ),
            ),
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/png/cent.png',
                width: 50.r,
                height: 50.r,
                fit: BoxFit.fill,
              ),
              Text("300", style: AppTextStyles.ls16),
            ],
          ),
        ),
        LabeledButton(
          label: "0,99\$",
          width: 62.r,
          height: 29.r,
          textStyle: AppTextStyles.ls14,
        ),
      ],
    );
  }
}
