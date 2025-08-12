import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:potion_maker/controllers/controllers.dart';
import 'package:potion_maker/game_application.dart';
import 'package:potion_maker/repositories/repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);

      final preferences = await SharedPreferences.getInstance();
      final appConfigRepository = AppConfigRepository(preferences);

      Get.put(appConfigRepository);
      Get.put(AppConfigController(appConfigRepository));

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
