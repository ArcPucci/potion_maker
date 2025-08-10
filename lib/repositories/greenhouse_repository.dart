import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potion_maker/models/models.dart';

class GreenhouseRepository {
  static final List<Bed> bedsList = [
    Bed(id: 0, price: 800, left: 14.w, bottom: 81.h),
    Bed(id: 1, price: 400, left: 195.w, bottom: 81.h),
    Bed(id: 2, price: 600, left: 100.w, bottom: 10.h),
    Bed(id: 3, right: 18.h, bottom: 84.h),
    Bed(id: 4, right: 193.h, bottom: 81.h),
    Bed(id: 5, right: 102.h, bottom: 9.h),
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
