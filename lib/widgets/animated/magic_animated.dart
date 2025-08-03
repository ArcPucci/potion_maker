import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MagicAnimated extends StatefulWidget {
  const MagicAnimated({super.key});

  @override
  _MagicAnimatedState createState() => _MagicAnimatedState();
}

class _MagicAnimatedState extends State<MagicAnimated>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _frame;

  final List<String> frames = [
    'assets/png/magic1.png',
    'assets/png/magic2.png',
    'assets/png/magic3.png',
    'assets/png/magic4.png',
    'assets/png/magic5.png',
  ];

  bool _isPrecached = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 10),
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
    return AnimatedBuilder(
      animation: _frame,
      builder: (context, child) {
        return Image.asset(
          frames[_frame.value],
          width: 101.r,
          height: 142.r,
          fit: BoxFit.fill,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
