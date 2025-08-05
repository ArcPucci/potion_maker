import 'package:flutter/material.dart';

import 'app_router.dart';

class GameApplication extends StatefulWidget {
  const GameApplication({super.key});

  @override
  State<GameApplication> createState() => _GameApplicationState();
}

class _GameApplicationState extends State<GameApplication> {
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: appRouter.router);
  }
}
