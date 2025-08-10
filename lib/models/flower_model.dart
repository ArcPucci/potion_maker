import 'package:potion_maker/models/models.dart';

class FlowerModel {
  final Flower flower;
  final DateTime dateTime;
  bool riped = false;

  FlowerModel({
    required this.flower,
    required this.dateTime,
    this.riped = false,
  });

  int get secondsToRipe =>
      600 - (DateTime.now().difference(dateTime).inSeconds);
}
