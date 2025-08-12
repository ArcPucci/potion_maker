import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:potion_maker/screens/main_screen.dart';
import 'package:potion_maker/screens/screens.dart';

import 'controllers/controllers.dart';

class GameApplication extends StatefulWidget {
  const GameApplication({super.key});

  @override
  State<GameApplication> createState() => _GameApplicationState();
}

class _GameApplicationState extends State<GameApplication> {
  final configController = Get.find<AppConfigController>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: configController.welcome ? MainScreen() : WelcomeScreen(),
    );
  }
}
