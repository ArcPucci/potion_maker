import 'dart:async';
import 'package:flutter/material.dart';
import 'package:potion_maker/models/models.dart';

class BedModel {
  final Bed bed;
  final FlowerModel? flowerModel;
  Timer? timer;
  AnimationController? controller;

  BedModel({required this.bed, this.flowerModel, this.timer, this.controller});
}
