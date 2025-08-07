import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../repositories/repositories.dart';

class WarehouseCard extends StatelessWidget {
  const WarehouseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 289.r,
      height: 70.r,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/png/wood_bg_3.png'),
          fit: BoxFit.fill,
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 4,
            color: Colors.black.withAlpha(25),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 14.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(GreenhouseRepository.warehouse.length, (index) {
          final flower = GreenhouseRepository.warehouse[index];
          return Container(
            width: 31.r,
            height: 43.r,
            decoration: BoxDecoration(
              color: Color(0xFF009DA8).withAlpha(46),
              borderRadius: BorderRadius.circular(6),
              border: GradientBoxBorder(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF01C28B), Color(0xFF00573F)],
                ),
              ),
            ),
            child: Image.asset(
              flower.asset,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          );
        }),
      ),
    );
  }
}
