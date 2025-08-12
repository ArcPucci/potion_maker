import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potion_maker/widgets/widgets.dart';

class AnimatedPulsingCursor extends StatefulWidget {
  const AnimatedPulsingCursor({super.key});

  @override
  State<AnimatedPulsingCursor> createState() => _AnimatedPulsingCursorState();
}

class _AnimatedPulsingCursorState extends State<AnimatedPulsingCursor>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 81.r,
      height: 77.r,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              Positioned(top: 0, left: 0, child: AlternatingRings()),
              Transform.translate(
                offset: Offset(
                  -24 * _controller.value,
                  -10 * _controller.value,
                ),
                child: Image.asset(
                  'assets/png/cursor.png',
                  width: 57.r,
                  height: 65.r,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
