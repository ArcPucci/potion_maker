import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potion_maker/utils/utils.dart';
import 'package:potion_maker/widgets/buttons/buttons.dart';

class PotionMakerInfoDialog extends StatelessWidget {
  const PotionMakerInfoDialog({
    super.key,
    this.onStart,
    this.onTraining,
    this.playing = false,
  });

  final bool playing;
  final VoidCallback? onStart;
  final VoidCallback? onTraining;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: SizedBox(
            width: 287.r,
            height: 268.r,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 0,
                  child: Image.asset(
                    'assets/png/letter_bg.png',
                    width: 250.r,
                    height: 240.r,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 5.r,
                  child: Image.asset(
                    'assets/png/info_image.png',
                    width: 107.r * 1.1,
                    height: 56.r * 1.1,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.r),
                  child: SizedBox(
                    width: 174.r,
                    child: Text(
                      "Before starting the game, we suggest going through a brief tutorial. If you agree, click the Continue button; if you want to skip the tutorial, click the Start Game button."
                          .toUpperCase(),
                      style: AppTextStyles.ls10.copyWith(
                        fontSize: 10.r,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LabeledButton(
                        label: playing ? "START" : "START GAME",
                        width: 134.r,
                        height: 43.r,
                        textStyle: AppTextStyles.ls18,
                        onTap: () {
                          Navigator.pop(context, !playing);

                          if (playing) {
                            onTraining?.call();
                            return;
                          }

                          onStart?.call();
                        },
                      ),
                      LabeledButton(
                        label: playing ? "CONTINUE" : "TRAINING",
                        width: 134.r,
                        height: 43.r,
                        textStyle: AppTextStyles.ls18,
                        onTap: () {
                          Navigator.pop(context, playing);

                          if (playing) return;

                          onTraining?.call();
                        },
                      ),
                    ],
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
