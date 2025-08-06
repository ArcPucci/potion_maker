import 'package:flutter/material.dart';
import 'package:potion_maker/widgets/widgets.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LabeledButton2(label: "MENU", onTap: () => showMenuDialog(context));
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
