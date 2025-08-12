import 'package:potion_maker/models/models.dart';

abstract class Crystal extends Ingredient {
  Crystal({
    required super.name,
    required this.price,
    required super.asset,
    required this.assetCup,
  });

  final int price;
  final String assetCup;
}

class BlueCrystal extends Crystal {
  BlueCrystal({
    super.name = "Blue Crystal",
    super.price = 200,
    super.asset = "assets/png/blue_crystal.png",
    super.assetCup = "assets/png/blue_crystal_cup.png",
  });
}

class OrangeCrystal extends Crystal {
  OrangeCrystal({
    super.name = "Orange Crystal",
    super.price = 150,
    super.asset = "assets/png/orange_crystal.png",
    super.assetCup = "assets/png/orange_crystal_cup.png",
  });
}

class WhiteCrystal extends Crystal {
  WhiteCrystal({
    super.name = "White Crystal",
    super.price = 300,
    super.asset = "assets/png/white_crystal.png",
    super.assetCup = "assets/png/white_crystal_cup.png",
  });
}
