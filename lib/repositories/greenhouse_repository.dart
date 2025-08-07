import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potion_maker/models/models.dart';

class GreenhouseRepository {
  static final List<Bed> bedsList = [
    Bed(left: 14.w, bottom: 81.h),
    Bed(left: 195.w, bottom: 81.h),
    Bed(left: 100.w, bottom: 10.h),
    Bed(right: 18.h, bottom: 84.h),
    Bed(right: 193.h, bottom: 81.h),
    Bed(right: 102.h, bottom: 9.h),
  ];

  static final List<Flower> warehouse = [
    Flower3(),
    Flower4(),
    Flower5(),
    Flower2(),
    Flower1(),
    Flower6(),
  ];

  static final List<Flower> shopFlowers = [Flower6(), Flower4(), Flower5()];
}
