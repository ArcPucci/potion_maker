import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HandAnimation1 extends StatefulWidget {
  const HandAnimation1({super.key});

  @override
  State<HandAnimation1> createState() => _HandAnimation1State();
}

class _HandAnimation1State extends State<HandAnimation1>
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
      width: 412.sp,
      height: 125.sp,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Image.asset(
              'assets/png/line1.png',
              width: 412.sp,
              height: 76.sp,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: 12.sp,
            bottom: 0,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return Transform.translate(
                  offset: Offset(
                    350.sp * _controller.value,
                    -36.sp * _controller.value,
                  ),
                  child: SizedBox(
                    width: 69.sp,
                    height: 88.sp,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Image.asset(
                            'assets/png/flowers/flower2.png',
                            width: 37.sp,
                            height: 53.sp,
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Image.asset(
                            'assets/png/cursor.png',
                            width: 57.sp,
                            height: 65.sp,
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
