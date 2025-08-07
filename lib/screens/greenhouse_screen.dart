import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potion_maker/repositories/repositories.dart';
import 'package:potion_maker/utils/utils.dart';
import 'package:potion_maker/widgets/widgets.dart';

class GreenhouseScreen extends StatelessWidget {
  const GreenhouseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            left: -2.w,
            child: Image.asset('assets/png/garden_bg.png', fit: BoxFit.fill),
          ),
          Positioned(
            top: 24.h,
            left: 30.w,
            child: GestureDetector(
              onTap: Navigator.of(context).pop,
              child: Image.asset(
                'assets/png/back.png',
                width: 81.r,
                height: 62.r,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 29.h,
            right: 20.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    BudgetBox(),
                    SizedBox(width: 10.w),
                    MenuButton(),
                  ],
                ),
                SizedBox(height: 5.h),
                RecipesButton(width: 75.r, height: 75.r),
              ],
            ),
          ),
          Positioned(
            top: 20.h,
            child: Padding(
              padding: EdgeInsets.only(right: 14.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: GestureDetector(
                      onTap: () => showInfoDialog(context),
                      child: Image.asset(
                        'assets/png/info.png',
                        width: 60.r,
                        height: 67.r,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 11.w),
                  Column(
                    children: [
                      CustomBorderedText(
                        text: "WAREHOUSE:",
                        strokeWidth: 2.sp,
                        strokeColor: AppTheme.darkOrange1,
                        textStyle: AppTextStyles.ls24.copyWith(height: 0.8),
                      ),
                      WarehouseCard(),
                    ],
                  ),
                  SizedBox(width: 11.w + 60.r),
                ],
              ),
            ),
          ),
          Positioned(
            top: 241.h,
            child: Padding(
              padding: EdgeInsets.only(right: 15.r),
              child: LabeledButton(
                label: "OPEN A STORE",
                width: 143.r,
                height: 46.r,
                textStyle: AppTextStyles.ls17.copyWith(letterSpacing: 0),
                onTap: () => showSeedStoreDialog(context),
              ),
            ),
          ),
          ...List.generate(GreenhouseRepository.bedsList.length, (index) {
            final bed = GreenhouseRepository.bedsList[index];
            return Positioned(
              top: bed.top,
              left: bed.left,
              right: bed.right,
              bottom: bed.bottom,
              child: BedWidget(),
            );
          }),
        ],
      ),
    );
  }

  void showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      useSafeArea: false,
      barrierColor: Colors.black.withAlpha(16),
      builder: (BuildContext context) {
        return GreenhouseInfoDialog();
      },
    );
  }

  void showSeedStoreDialog(BuildContext context) {
    showDialog(
      context: context,
      useSafeArea: false,
      barrierColor: Colors.black.withAlpha(16),
      builder: (BuildContext context) {
        return SeedStoreDialog();
      },
    );
  }
}
