import 'package:potion_maker/models/models.dart';

abstract class Crystal extends Ingredient {
  Crystal({required super.name, required super.asset});
}

class BlueCrystal extends Crystal {
  BlueCrystal({
    super.name = "Blue Crystal",
    super.asset = "assets/png/blue_crystal.png",
  });
}

class OrangeCrystal extends Crystal {
  OrangeCrystal({
    super.name = "Orange Crystal",
    super.asset = "assets/png/orange_crystal.png",
  });
}

class WhiteCrystal extends Crystal {
  WhiteCrystal({
    super.name = "White Crystal",
    super.asset = "assets/png/white_crystal.png",
  });
}
