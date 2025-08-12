import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potion_maker/models/models.dart';

class PotionMakerRepository {
  static final List<BigFlowerModel> bigFlowers = [
    BigFlowerModel(
      id: 0,
      left: 10.r,
      bottom: 78.r,
      width: 88.r,
      height: 84.r,
      flower: Flower4(),
    ),
    BigFlowerModel(
      id: 1,
      left: 116.r,
      bottom: 80.r,
      width: 84.r,
      height: 109.r,
      flower: Flower2(),
    ),
    BigFlowerModel(
      id: 2,
      left: 220.r,
      bottom: 82.r,
      width: 84.r,
      height: 110.r,
      flower: Flower1(),
    ),
    BigFlowerModel(
      id: 3,
      left: 9.r,
      bottom: 20.r,
      width: 84.r,
      height: 83.r,
      flower: Flower3(),
    ),
    BigFlowerModel(
      id: 4,
      left: 115.r,
      bottom: 20.r,
      width: 85.r,
      height: 84.r,
      flower: Flower6(),
    ),
    BigFlowerModel(
      id: 5,
      left: 221.r,
      bottom: 20.r,
      width: 84.r,
      height: 83.r,
      flower: Flower5(),
    ),
  ];

  static final List<CrystalModel> crystals = [
    CrystalModel(
      id: 0,
      right: 118.r,
      bottom: 43.r,
      width: 41.r,
      height: 57.r,
      crystal: BlueCrystal(),
    ),
    CrystalModel(
      id: 1,
      right: 71.r,
      bottom: 23.r,
      width: 41.r,
      height: 47.r,
      crystal: WhiteCrystal(),
    ),
    CrystalModel(
      id: 2,
      right: 23.r,
      bottom: 47.r,
      width: 41.r,
      height: 56.r,
      crystal: OrangeCrystal(),
    ),
  ];
}
