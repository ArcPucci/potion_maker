import 'package:potion_maker/models/models.dart';

abstract class Flower extends Ingredient {
  final bool ripe;
  final List<String> states;
  final int price;

  Flower({
    required super.name,
    required super.asset,
    required this.ripe,
    required this.states,
    this.price = 0,
  });
}

class Flower1 extends Flower {
  Flower1({
    super.name = "Flower1",
    super.asset = "assets/png/flowers/flower1.png",
    super.ripe = true,
  }) : super(states: []);
}

class Flower2 extends Flower {
  Flower2({
    super.name = "Flower2",
    super.asset = "assets/png/flowers/flower2.png",
    super.ripe = true,
  }) : super(states: []);
}

class Flower3 extends Flower {
  Flower3({
    super.name = "Flower3",
    super.asset = "assets/png/flowers/flower3.png",
    super.ripe = true,
  }) : super(states: []);
}

class Flower4 extends Flower {
  Flower4({
    super.name = "Flower4",
    super.asset = "assets/png/flowers/flower4_3.png",
    super.ripe = true,
    super.price = 300,
  }) : super(
         states: [
           "assets/png/flowers/flower4_1.png",
           "assets/png/flowers/flower4_2.png",
           "assets/png/flowers/flower4_3.png",
         ],
       );
}

class Flower5 extends Flower {
  Flower5({
    super.name = "Flower5",
    super.asset = "assets/png/flowers/flower5_3.png",
    super.ripe = true,
    super.price = 500,
  }) : super(
         states: [
           "assets/png/flowers/flower5_1.png",
           "assets/png/flowers/flower5_2.png",
           "assets/png/flowers/flower5_3.png",
         ],
       );
}

class Flower6 extends Flower {
  Flower6({
    super.name = "Flower6",
    super.asset = "assets/png/flowers/flower6_3.png",
    super.ripe = true,
    super.price = 200,
  }) : super(
         states: [
           "assets/png/flowers/flower6_1.png",
           "assets/png/flowers/flower6_2.png",
           "assets/png/flowers/flower6_3.png",
         ],
       );
}
