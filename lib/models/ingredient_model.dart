import 'package:potion_maker/models/models.dart';

class IngredientModel {
  final Ingredient ingredient;
  final bool? correct;

  IngredientModel({
    required this.ingredient,
    required this.correct,
  });
}
