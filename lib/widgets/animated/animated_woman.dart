import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedWoman extends StatefulWidget {
  const AnimatedWoman({super.key});

  @override
  State<AnimatedWoman> createState() => _AnimatedWomanState();
}

class _AnimatedWomanState extends State<AnimatedWoman>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;

  bool _isPrecached = false;

  final List<String> frames = [
    'assets/png/woman1.png',
    'assets/png/woman2.png',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);

    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat();
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
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 133.r,
      height: 311.r,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 11.r,
            child: Image.asset(
              'assets/png/shadow1.png',
              width: 103.r,
              height: 25.r,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 37.r,
            left: 5.r,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return Transform(
                  alignment: Alignment.bottomRight,
                  transform: Matrix4.rotationZ(-_controller.value * 0.1 * pi),
                  child: Image.asset(
                    'assets/png/hand.png',
                    width: 34.r,
                    height: 97.r,
                    fit: BoxFit.fill,
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 0,
            right: 7.r,
            child: AnimatedBuilder(
              animation: _controller2,
              builder: (BuildContext context, Widget? child) {
                final index = _controller2.value > 0.9 ? 2 : 1;
                return Image.asset(
                  'assets/png/woman$index.png',
                  width: 111.r,
                  height: 290.r,
                  fit: BoxFit.fill,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
