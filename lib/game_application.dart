import 'package:flutter/material.dart';
import 'package:potion_maker/screens/screens.dart';

class GameApplication extends StatelessWidget {
  const GameApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: WelcomeScreen());
  }
}
