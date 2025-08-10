import 'dart:async';

import 'package:potion_maker/models/models.dart';

class BedModel {
  final Bed bed;
  final FlowerModel? flowerModel;
  Timer? timer;

  BedModel({required this.bed, this.flowerModel});
}