import 'package:potion_maker/models/models.dart';

class BigFlowerModel {
  final int id;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final double width;
  final double height;
  final Flower flower;

  BigFlowerModel({
    required this.id,
    this.top,
    this.left,
    this.right,
    this.bottom,
    required this.width,
    required this.height,
    required this.flower,
  });
}
