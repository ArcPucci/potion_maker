import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:potion_maker/widgets/widgets.dart';

import '../controllers/controllers.dart';
import '../utils/utils.dart';

class BudgetBox extends StatelessWidget {
  const BudgetBox({
    super.key,
    this.hasPlus = true,
    this.budget,
    this.hasSymbol = false,
    this.onTapPlus,
    this.onOpen,
    this.onClose,
  });

  final bool hasSymbol;
  final bool hasPlus;
  final int? budget;
  final VoidCallback? onTapPlus;
  final VoidCallback? onOpen;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130.r,
      height: 34.r,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5.r),
            child: Container(
              width: 102.r,
              height: 27.r,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/png/wood_bg.png'),
                  fit: BoxFit.fill,
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: Colors.black.withValues(alpha: 0.25),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 36.r,
            right: 20.r,
            child: GetBuilder<AppConfigController>(
              builder: (controller) {
                return FittedBox(
                  fit: BoxFit.scaleDown,
                  child: CustomBorderedText(
                    text: budget != null
                        ? "${hasSymbol
                              ? budget! > 0
                                    ? '+'
                                    : '-'
                              : ""}${budget?.toString()}"
                        : '${controller.coins}',
                    strokeWidth: 1.9.sp,
                    textStyle: AppTextStyles.ls18.copyWith(fontSize: 18.r),
                    strokeColor: AppTheme.darkOrange1,
                  ),
                );
              },
            ),
          ),
          Positioned(
            left: 0,
            child: Image.asset(
              'assets/png/cent.png',
              width: 36.r,
              height: 36.r,
              fit: BoxFit.fill,
            ),
          ),
          if (hasPlus)
            Positioned(
              right: 0,
              child: GestureDetector(
                onTap: () async {
                  if (onTapPlus != null) {
                    onTapPlus?.call();
                    return;
                  }
                  onOpen?.call();
                  await showShopDialog(context);
                  onClose?.call();
                },
                child: Image.asset(
                  'assets/png/add.png',
                  width: 20.r,
                  height: 20.r,
                  fit: BoxFit.fill,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> showShopDialog(BuildContext context) async {
    await showDialog(
      context: context,
      useRootNavigator: false,
      barrierColor: Colors.black.withValues(alpha: 0.16),
      builder: (BuildContext context) {
        return CoinsShopDialog();
      },
    );
  }
}
