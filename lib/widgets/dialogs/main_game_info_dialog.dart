import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potion_maker/utils/utils.dart';

class MainGameInfoDialog extends StatefulWidget {
  const MainGameInfoDialog({super.key});

  @override
  State<MainGameInfoDialog> createState() => _MainGameInfoDialogState();
}

class _MainGameInfoDialogState extends State<MainGameInfoDialog> {
  final controller = ScrollController();
  static final double _thumbHeight = 20.r;
  double _thumbPosition = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(_updateThumbPosition);
  }

  void _updateThumbPosition() {
    double maxScrollExtent = controller.position.maxScrollExtent;
    double viewHeight = controller.position.viewportDimension - 10.r;

    if (maxScrollExtent > 0) {
      setState(() {
        _thumbPosition =
            (controller.offset / maxScrollExtent) * (viewHeight - _thumbHeight);
      });
    }
  }

  @override
  void dispose() {
    controller.removeListener(_updateThumbPosition);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: SizedBox(
              width: 492.r,
              height: 335.r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/png/letter_bg_3.png',
                          width: 440.r,
                          height: 313.r,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          top: 77.r,
                          left: 78.r,
                          right: 68.r,
                          bottom: 65.r,
                          child: SingleChildScrollView(
                            controller: controller,
                            child: Column(
                              children: [
                                Text(
                                  "You are in the main menu, where access to three interconnected games is available. Let's start with the main one."
                                      .toUpperCase(),
                                  style: AppTextStyles.pp10_600,
                                ),
                                SizedBox(height: 22.h),
                                Text(
                                  "MAIN GAME",
                                  style: AppTextStyles.pp10_600.copyWith(
                                    color: AppTheme.green1,
                                  ),
                                ),
                                SizedBox(height: 7.h),
                                Text(
                                  "In the main game, you take on the role of the assistant to a sorceress and fulfill potion orders. But it's not that simple: to brew potions, you'll need recipes and ingredients — this is where the connection to other games begins."
                                      .toUpperCase(),
                                  style: AppTextStyles.pp10_600,
                                ),
                                SizedBox(height: 9.h),
                                Image.asset(
                                  'assets/png/info_image_1.png',
                                  width: 230.r,
                                  height: 105.r,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(height: 13.h),
                                Text(
                                  """For successfully completed orders within the time limit, you earn coins. These can be spent on spinning the Wheel of Knowledge or purchasing seeds for magical plants at the shop located in the greenhouse.
At the start of the game, you receive 3 basic recipes and 3 simple magical herbs as a gift — enough to get started right away and earn coins to buy new recipes and rare herbs.
The more complex the recipe, the more valuable the potion. This means your reward for it will be higher."""
                                      .toUpperCase(),
                                  style: AppTextStyles.pp10_600,
                                ),
                                SizedBox(height: 16.h),
                                Text(
                                  "GREENHOUSE",
                                  style: AppTextStyles.pp10_600.copyWith(
                                    color: AppTheme.green1,
                                  ),
                                ),
                                SizedBox(height: 7.h),
                                Text(
                                  "In this part of the game, you grow ingredients for potion-making. At the very beginning, you receive 3 basic magical herbs, which are enough to create simple yet inexpensive elixirs. To earn more, you will need to acquire new magical plants and expand your plots for cultivation. Upgrade your greenhouse, discover rare herbs, and increase your yield—all in the name of great potions!"
                                      .toUpperCase(),
                                  style: AppTextStyles.pp10_600,
                                ),
                                SizedBox(height: 10.h),
                                Image.asset(
                                  'assets/png/info_image_2.png',
                                  width: 230.r,
                                  height: 105.r,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(height: 21.h),
                                Text(
                                  "WHEEL OF KNOWLEDGE",
                                  style: AppTextStyles.pp10_600.copyWith(
                                    color: AppTheme.green1,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  "In this section of the game, you can win the rarest recipes! To try your luck, you'll need coins—place your bets and watch the outcome. Winning will bring you new magical books and unique recipes, while losing will only grant you experience. Take risks to expand your collection and become a true master of potion-making!"
                                      .toUpperCase(),
                                  style: AppTextStyles.pp10_600,
                                ),
                                SizedBox(height: 19.h),
                                Image.asset(
                                  'assets/png/info_image_3.png',
                                  width: 230.r,
                                  height: 105.r,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(height: 23.h),
                                Text(
                                  "RECIPE BOOK",
                                  style: AppTextStyles.pp10_600.copyWith(
                                    color: AppTheme.green1,
                                  ),
                                ),
                                SizedBox(height: 7.h),
                                Image.asset(
                                  'assets/png/recipes.png',
                                  width: 70.r,
                                  height: 71.r,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(height: 15.h),
                                Text(
                                  "In this section of the game, you can win the rarest recipes! To try your luck, you'll need coins—place your bets and watch the outcome. Winning will bring you new magical books and unique recipes, while losing will only grant you experience. Take risks to expand your collection and become a true master of potion-making!"
                                      .toUpperCase(),
                                  style: AppTextStyles.pp10_600,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 77.r + _thumbPosition,
                          right: 63.r,
                          child: Container(
                            width: 5.sp,
                            height: 20.sp,
                            decoration: BoxDecoration(
                              color: Color(0xFF01C28B),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10.r,
                          left: 197.r,
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                colors: [Color(0xFF01C23B), Color(0xFF00571D)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ).createShader(bounds);
                            },
                            child: Text("INFO", style: AppTextStyles.ls36),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: Navigator.of(context).pop,
                    child: Image.asset(
                      'assets/png/close.png',
                      width: 43.r,
                      height: 43.r,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
