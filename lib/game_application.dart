import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:potion_maker/screens/main_screen.dart';

class GameApplication extends StatelessWidget {
  const GameApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: MainScreen());
  }
}
