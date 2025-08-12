import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potion_maker/models/models.dart';

import '../../utils/utils.dart';
import '../buttons/buttons.dart';

class CoinCard extends StatelessWidget {
  const CoinCard({super.key, required this.coinsModel, this.onBuy});

  final CoinsModel coinsModel;
  final VoidCallback? onBuy;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          coinsModel.asset,
          width: 75.r,
          height: 75.r,
          fit: BoxFit.fill,
        ),
        LabeledButton(
          label: coinsModel.priceString,
          width: 62.r,
          height: 29.r,
          textStyle: AppTextStyles.ls14.copyWith(fontSize: 14.r),
          onTap: onBuy,
        ),
      ],
    );
  }
}
