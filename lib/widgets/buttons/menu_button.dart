import 'package:flutter/material.dart';
import 'package:potion_maker/widgets/widgets.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key, this.onTap, this.onOpen, this.onClose});

  final VoidCallback? onTap;
  final VoidCallback? onOpen;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return LabeledButton2(
      label: "MENU",
      onTap: () async {
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
