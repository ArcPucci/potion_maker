import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/models.dart';

class BigFlowerCard extends StatelessWidget {
  const BigFlowerCard({
    super.key,
    required this.canDrag,
    required this.bigFlower,
    this.locked = false,
  });

  final bool canDrag;
  final bool locked;
  final BigFlowerModel bigFlower;

  @override
  Widget build(BuildContext context) {
    if (canDrag && !locked) {
      return Draggable<Ingredient>(
        data: bigFlower.flower,
        feedback: Image.asset(
          bigFlower.flower.asset,
          width: 37.r,
          height: 53.r,
          fit: BoxFit.fill,
        ),
        child: Image.asset(
          bigFlower.flower.bigAsset,
          width: bigFlower.width,
          height: bigFlower.height,
          fit: BoxFit.fill,
        ),
      );
    }

    return Opacity(
      opacity: locked ? 0.5 : 1,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            bigFlower.flower.bigAsset,
            width: bigFlower.width,
            height: bigFlower.height,
            fit: BoxFit.fill,
          ),
          if (locked)
            Image.asset(
              'assets/png/lock.png',
              width: 35.r,
              height: 44.r,
              fit: BoxFit.fill,
            ),
        ],
      ),
    );
  }
}
