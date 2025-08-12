import '../models/models.dart';

class ShopRepo {
  static final List<CoinsModel> coinsList = [
    CoinsModel(
      id: 0,
      asset: 'assets/png/coins300.png',
      quantity: 300,
      price: 0.99,
      priceString: "0,99\$",
    ),
    CoinsModel(
      id: 1,
      asset: 'assets/png/coins450.png',
      quantity: 450,
      price: 1.99,
      priceString: "1,99\$",
    ),
    CoinsModel(
      id: 2,
      asset: 'assets/png/coins600.png',
      quantity: 600,
      price: 2.99,
      priceString: "2,99\$",
    ),
    CoinsModel(
      id: 3,
      asset: 'assets/png/coins1000.png',
      quantity: 1000,
      price: 3.99,
      priceString: "3,99\$",
    ),
  ];
}