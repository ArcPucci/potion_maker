class CoinsModel {
  final int id;
  final String asset;
  final int quantity;
  final double price;
  final String priceString;

  CoinsModel({
    required this.id,
    required this.asset,
    required this.quantity,
    required this.price,
    required this.priceString,
  });
}
