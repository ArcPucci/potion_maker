class Bed {
  final int id;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final int price;

  Bed({
    required this.id,
    this.top,
    this.left,
    this.right,
    this.bottom,
    this.price = 0,
  });
}
