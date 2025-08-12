import 'package:flutter/material.dart';
import 'package:potion_maker/widgets/widgets.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return LabeledButton2(
      label: "MENU",
      onTap: () {
        if(onTap != null) {
          onTap?.call();
          return;
        }
        showMenuDialog(context);
      },
    );
  }

  void showMenuDialog(context) {
    showDialog(
      context: context,
      useSafeArea: false,
      barrierColor: Colors.black.withAlpha(16),
      builder: (context) => MenuDialog(),
    );
  }
}
