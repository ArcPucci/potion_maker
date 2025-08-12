import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HandAnimation2 extends StatefulWidget {
  const HandAnimation2({super.key});

  @override
  State<HandAnimation2> createState() => _HandAnimation2State();
}

class _HandAnimation2State extends State<HandAnimation2>
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
      width: 203.r,
      height: 147.r,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Image.asset(
              'assets/png/line2.png',
              width: 203.r,
              height: 92.r,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return Transform.translate(
                  offset: Offset(
                    -123.r * _controller.value,
                    66.r * _controller.value,
                  ),
                  child: SizedBox(
                    width: 79.r,
                    height: 79.r,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Image.asset(
                            'assets/png/green_dust.png',
                            width: 51.r,
                            height: 28.r,
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Image.asset(
                            'assets/png/cursor.png',
                            width: 57.r,
                            height: 65.r,
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
