import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potion_maker/game_application.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);

      runApp(
        ScreenUtilInit(
          designSize: Size(844, 390),
          builder: (context, child) => const GameApplication(),
        ),
      );
    },
    (error, stack) {
      print(error);
      print(stack);
    },
  );
}
