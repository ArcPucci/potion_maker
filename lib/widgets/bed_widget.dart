import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potion_maker/models/models.dart';
import 'package:potion_maker/utils/utils.dart';
import 'package:potion_maker/widgets/widgets.dart';

class BedWidget extends StatelessWidget {
  const BedWidget({
    super.key,
    this.price = 0,
    this.isBought = true,
    this.riped = true,
    this.flower,
    this.onBuy,
    this.onSelect,
    this.secondsToRipe = 0,
    this.controller,
  });

  final int price;
  final bool riped;
  final bool isBought;
  final Flower? flower;
  final int secondsToRipe;
  final AnimationController? controller;
  final VoidCallback? onBuy;
  final VoidCallback? onSelect;

  @override
  Widget build(BuildContext context) {
    final seconds = (secondsToRipe % 60).toString().padLeft(2, '0');
    final minutes = (secondsToRipe ~/ 60).toString().padLeft(2, '0');

    final percent = ((1 - secondsToRipe / 600) * 100).round();
    final time = '$minutes:$seconds';

    return SizedBox(
      width: 127.r,
      height: 133.r,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (controller != null)
            Positioned(
              bottom: 0,
              child: AnimatedBuilder(
                animation: controller!,
                builder: (BuildContext context, Widget? child) {
                  final opacity = sin(controller!.value * pi);
                  return Container(
                    width: 127.r,
                    height: 65.r,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, -1),
                          blurRadius: 32,
                          color: Color(0xFFFFD90B).withValues(alpha: opacity),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          Positioned(
            bottom: 0,
            child: Image.asset(
              'assets/png/bed.png',
              width: 127.r,
              height: 65.r,
              fit: BoxFit.fill,
            ),
          ),
          if (!isBought)
            Positioned(
              bottom: 44.r,
              child: Image.asset(
                'assets/png/lock.png',
                width: 27.r,
                height: 34.r,
                fit: BoxFit.fill,
              ),
            ),
          if (isBought && (flower != null)) _buildFlower(percent),
          Positioned(bottom: 6.r, child: _buildButton(time)),
        ],
      ),
    );
  }

  Widget _buildFlower(int percent) {
    if (flower!.states.isEmpty) {
      return Positioned(
        bottom: 44.r,
        child: Image.asset(flower!.asset, width: 55.r, height: 94.r),
      );
    }
    if (percent < 50) {
      return Positioned(
        bottom: 46.r,
        child: Image.asset(flower!.states[0], width: 19.r, height: 20.r),
      );
    }
    if (percent < 90) {
      return Positioned(
        bottom: 44.r,
        child: Image.asset(flower!.states[1], width: 41.r, height: 65.r),
      );
    }
    return Positioned(
      bottom: 44.r,
      child: Image.asset(flower!.states.last, width: 55.r, height: 94.r),
    );
  }

  Widget _buildButton(String time) {
    if (riped) return SizedBox();
    if (isBought) {
      if (flower != null) {
        return SizedBox(
          width: 76.r,
          height: 34.r,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 0,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/png/buttons/button1.png',
                      width: 64.r,
                      height: 26.r,
                      fit: BoxFit.fill,
                    ),
                    CustomBorderedText(
                      text: time,
                      strokeWidth: 1.sp,
                      textStyle: AppTextStyles.ls11,
                      strokeColor: AppTheme.darkOrange1,
                    ),
                  ],
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

      return LabeledButton(
        label: "TO PLANT",
        textStyle: AppTextStyles.ls11,
        width: 64.r,
        height: 26.r,
        onTap: onSelect,
      );
    }
    return LabeledButton3(price: price, onTap: onBuy);
  }
}
