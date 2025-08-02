import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potion_maker/utils/utils.dart';
import 'package:potion_maker/widgets/widgets.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final pageController = PageController();
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (value) => _pageIndex = value,
        children: [_buildPage1(), _buildPage2(), _buildPage3(), _buildPage4()],
      ),
    );
  }

  Widget _buildPage1() {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/png/onboarding1.png', fit: BoxFit.cover),
        ),
        Positioned(
          top: 64.h,
          right: 76.w,
          child: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/png/letter_bg.png',
                  width: 295.r,
                  height: 285.r,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.r, bottom: 4.r),
                  child: SizedBox(
                    width: 190.r,
                    child: Text(
                      'In the Realm of Eternal Ember and Twilight, hidden from human eyes, stood an ancient school of wizards. It was famous throughout the magical world for its legendary potions and rare herbs grown in enchanted greenhouses. Here, the secrets of nature were intertwined with magic, and the pages of ancient books held the power to change fate. In this school, one beautiful sorceress with red hair, Kate, studied and took orders for potions.',
                      style: AppTextStyles.lo11,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.only(right: 12.r),
                    child: LabeledButton(label: "NEXT", onTap: _nextPage),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPage2() {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/png/onboarding2.png', fit: BoxFit.cover),
        ),
        Positioned(
          top: 67.h,
          right: 45.w,
          child: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/png/letter_bg.png',
                  width: 295.r,
                  height: 285.r,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 190.r,
                  child: Text(
                    'To brew potions, she grew a multitude of magical plants in her greenhouse — it was her little, enchanting garden, full of magic and mysteries. Every morning she filled her basket with fragrant herbs and magical flowers, to then brew potions that spread throughout the kingdom, bringing help and healing to the people.',
                    style: AppTextStyles.lo11,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.only(right: 12.r),
                    child: LabeledButton(label: "NEXT", onTap: _nextPage),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPage3() {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/png/onboarding3.png', fit: BoxFit.cover),
        ),
        Positioned(
          top: 64.h,
          left: 67.w,
          child: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/png/letter_bg_2.png',
                  width: 295.r,
                  height: 285.r,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 9.r),
                  child: SizedBox(
                    width: 190.r,
                    child: Text(
                      'One of the most important places in her home was the recipe library — a spacious room where the dust of ages mingled with the scent of ancient herbs. Here lived books, scrolls, and notes collected over hundreds of years of magical knowledge. The shelves could barely hold the weight of volumes overflowing with spells, and on every page, a living magic seemed to pulse. The sorceress could spend hours flipping through the old pages in search of rare recipes and forgotten incantations.',
                      style: AppTextStyles.lo11,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: LabeledButton(label: "NEXT", onTap: _nextPage),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPage4() {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/png/onboarding4.png', fit: BoxFit.cover),
        ),
        Positioned(
          top: 67.h,
          right: 25.w,
          child: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/png/letter_bg.png',
                  width: 295.r,
                  height: 285.r,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 9.r),
                  child: SizedBox(
                    width: 190.r,
                    child: Text(
                      """Day by day, she gathered magical herbs and flowers in a basket to brew potions that spread across the kingdom, bringing help and hope to the people. But rumors of her talents spread far and wide, orders increased, and the sorceress could no longer manage alone. 
Now she needs your help. Become her apprentice: collect rare plants, study recipes, and brew potions alongside her. Ready? Click start and open the path to the world of magic.""",
                      style: AppTextStyles.lo11,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: LabeledButton(label: "START", onTap: _nextPage),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _nextPage() {
    if(_pageIndex == 3) {
      return;
    }

    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
