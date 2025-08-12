import 'package:potion_maker/models/models.dart';

class CrystalModel {
  final int id;
  final double? right;
  final double? bottom;
  final double width;
  final double height;
  final Crystal crystal;

  CrystalModel({
    required this.id,
    required this.right,
    required this.bottom,
    required this.width,
    required this.height,
    required this.crystal,
  });
}
