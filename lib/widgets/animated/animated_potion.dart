import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedPotion extends StatefulWidget {
  const AnimatedPotion({super.key});

  @override
  State<AnimatedPotion> createState() => _AnimatedPotionState();
}

class _AnimatedPotionState extends State<AnimatedPotion>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _frame;

  final List<String> frames = [
    'assets/png/potion1.png',
    'assets/png/potion2.png',
    'assets/png/potion3.png',
    'assets/png/potion4.png',
  ];

  bool _isPrecached = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _frame = IntTween(begin: 0, end: frames.length - 1).animate(_controller);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isPrecached) {
      for (final path in frames) {
        precacheImage(AssetImage(path), context);
      }
      _isPrecached = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 114.r,
      height: 188.r,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedBuilder(
          animation: _frame,
          builder: (context, child) {
            return Image.asset(
              frames[_frame.value],
              width: 114.r,
              fit: BoxFit.fitWidth,
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
