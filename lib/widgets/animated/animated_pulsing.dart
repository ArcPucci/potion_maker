import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlternatingRings extends StatefulWidget {
  const AlternatingRings({super.key});

  @override
  State<AlternatingRings> createState() => _AlternatingRingsState();
}

class _AlternatingRingsState extends State<AlternatingRings>
    with TickerProviderStateMixin {
  late AnimationController _whiteController;
  late AnimationController _pinkController;

  late Animation<double> _whiteScale;
  late Animation<double> _pinkScale;

  @override
  void initState() {
    super.initState();

    _whiteController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _pinkController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _whiteScale = Tween<double>(
      begin: 1.0,
      end: 2,
    ).animate(CurvedAnimation(parent: _whiteController, curve: Curves.easeOut));

    _pinkScale = Tween<double>(
      begin: 1.0,
      end: 2,
    ).animate(CurvedAnimation(parent: _pinkController, curve: Curves.easeOut));

    _startAnimation();
  }

  void _startAnimation() {
    if (!mounted) return;
    _whiteController.forward(from: 0).whenComplete(() {
      if (!mounted) return;
      Future.delayed(const Duration(milliseconds: 300), () {
        if (!mounted) return;
        _pinkController.forward(from: 0);
      });
    });

    Future.delayed(const Duration(seconds: 2), _startAnimation);
  }

  @override
  void dispose() {
    _whiteController.dispose();
    _pinkController.dispose();
    super.dispose();
  }

  Widget _buildRing(Animation<double> scale, Color color) {
    return ScaleTransition(
      scale: scale,
      child: Container(
        width: 17.r,
        height: 17.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: color, width: 1.sp),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/png/pink_ellipse.png',
          width: 17.r,
          height: 17.r,
          fit: BoxFit.fill,
        ),
        _buildRing(_whiteScale, Colors.white),
        _buildRing(_pinkScale, Colors.pink),
      ],
    );
  }
}
