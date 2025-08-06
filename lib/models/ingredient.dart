abstract class Ingredient {
  final String name;
  final String asset;

  Ingredient({required this.name, required this.asset});
}

class StoneCup extends Ingredient {
  StoneCup({
    super.name = "Stone Cup",
    super.asset = "assets/png/stone_cup.png",
  });
}
