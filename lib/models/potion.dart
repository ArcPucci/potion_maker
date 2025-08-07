import 'package:potion_maker/models/models.dart';

enum PotionType { normal, common, rare, veryRare }

class Potion {
  final String name;
  final String asset;
  final double angle;
  final String bookAsset;
  final PotionType type;
  final List<Ingredient> recipe;

  Potion({
    required this.name,
    required this.asset,
    this.angle = 0,
    required this.bookAsset,
    required this.type,
    required this.recipe,
  });
}
