import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:potion_maker/controllers/controllers.dart';

import '../../repositories/repositories.dart';

class WarehouseCard extends StatelessWidget {
  const WarehouseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GreenhouseController>(
      builder: (controller) {
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
            children: List.generate(GreenhouseRepository.warehouse.length, (
              index,
            ) {
              final flower = GreenhouseRepository.warehouse[index];
              final isBought = controller.availableFlowers.contains(
                flower.asset,
              );
              return Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: isBought ? 1 : 0.5,
                    child: Container(
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
                    ),
                  ),
                  if (!isBought)
                    Image.asset(
                      'assets/png/lock.png',
                      width: 27.r,
                      height: 34.r,
                      fit: BoxFit.fill,
                    ),
                ],
              );
            }),
          ),
        );
      },
    );
  }
}
