import 'package:potion_maker/models/models.dart';

class RecipeRepository {
  static final List<Potion> potionsList = [
    Potion(
      name: 'Root of Luck',
      asset: 'assets/png/potions/root_of_luck.png',
      angle: 13,
      type: PotionType.normal,
      recipe: [Flower2(), Flower1(), StoneCup()],
    ),
    Potion(
      name: 'Mist Drop',
      asset: 'assets/png/potions/mist_drop.png',
      type: PotionType.normal,
      recipe: [Flower1(), Flower3(), StoneCup()],
    ),
    Potion(
      name: 'Forest Dust',
      asset: 'assets/png/potions/forest_dust.png',
      angle: 17,
      type: PotionType.normal,
      recipe: [Flower3(), Flower2(), Flower1(), StoneCup()],
    ),
    Potion(
      name: 'Petal Brew',
      asset: 'assets/png/potions/petal_brew.png',
      angle: 15,
      type: PotionType.common,
      recipe: [Flower2(), Flower3(), Flower4(), StoneCup()],
    ),
    Potion(
      name: 'Sweet Bubble',
      asset: 'assets/png/potions/sweet_bubble.png',
      angle: 7,
      type: PotionType.common,
      recipe: [Flower4(), Flower2(), WhiteCrystal(), StoneCup()],
    ),
    Potion(
      name: 'Dew of Piece',
      asset: 'assets/png/potions/dew_of_piece.png',
      angle: 18,
      type: PotionType.common,
      recipe: [Flower6(), OrangeCrystal(), Flower4(), StoneCup()],
    ),
    Potion(
      name: 'Whisper',
      asset: 'assets/png/potions/whisper.png',
      type: PotionType.rare,
      recipe: [Flower4(), Flower3(), WhiteCrystal(), StoneCup()],
    ),
    Potion(
      name: 'Crystal Dream',
      asset: 'assets/png/potions/crystal_dream.png',
      type: PotionType.rare,
      recipe: [BlueCrystal(), Flower5(), Flower4(), StoneCup()],
    ),
    Potion(
      name: 'Ashen Glow',
      asset: 'assets/png/potions/ashen_glow.png',
      type: PotionType.rare,
      recipe: [WhiteCrystal(), Flower4(), BlueCrystal(), StoneCup()],
    ),
    Potion(
      name: "Ether's Cry",
      asset: 'assets/png/potions/ether_cry.png',
      angle: 26,
      type: PotionType.veryRare,
      recipe: [Flower5(), Flower1(), BlueCrystal(), StoneCup()],
    ),
    Potion(
      name: 'Shadow Elixir',
      asset: 'assets/png/potions/shadow_elixir.png',
      angle: 26,
      type: PotionType.veryRare,
      recipe: [Flower5(), WhiteCrystal(), BlueCrystal(), StoneCup()],
    ),
    Potion(
      name: 'Timeless Surge',
      asset: 'assets/png/potions/timeless_surge.png',
      angle: 22,
      type: PotionType.veryRare,
      recipe: [BlueCrystal(), OrangeCrystal(), Flower5(), StoneCup()],
    ),
  ];
}
