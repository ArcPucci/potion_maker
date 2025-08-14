import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:potion_maker/widgets/widgets.dart';

import '../../controllers/controllers.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key, this.onTap, this.onOpen, this.onClose});

  final VoidCallback? onTap;
  final VoidCallback? onOpen;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppConfigController>();
    return LabeledButton2(
      label: "MENU",
      onTap: () async {
        controller.playSound();
        if (onTap != null) {
          onTap?.call();
          return;
        }
        onOpen?.call();
        await showMenuDialog(context);
        onClose?.call();
      },
    );
  }

  Future<void> showMenuDialog(context) async {
    await showDialog(
      context: context,
      useSafeArea: false,
      barrierColor: Colors.black.withAlpha(16),
      builder: (context) => MenuDialog(),
    );
  }
}
