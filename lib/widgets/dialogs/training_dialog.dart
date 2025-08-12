import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:potion_maker/controllers/controllers.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class TrainingDialog extends StatefulWidget {
  const TrainingDialog({super.key});

  @override
  State<TrainingDialog> createState() => _TrainingDialogState();
}

class _TrainingDialogState extends State<TrainingDialog> {
  int _currentStack = 0;

  late final List<Widget Function()> _builders;

  @override
  void initState() {
    super.initState();
    _builders = [
      () => _buildStack1(),
      () => _buildStack2(),
      () => _buildStack3(),
      () => _buildStack4(),
      () => _buildStack5(),
      () => _buildStack6(),
      () => _buildStack7(),
      () => _buildStack8(),
      () => _buildStack9(),
      () => _buildStack10(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: _builders[_currentStack]().copyWithKey(ValueKey(_currentStack)),
      ),
    );
  }

  Widget _buildStack1() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Image.asset('assets/png/training1.png', fit: BoxFit.cover),
        ),
        Positioned(
          bottom: 20.r,
          child: Padding(
            padding: EdgeInsets.only(left: 20.r),
            child: _buildLetter('assets/png/letter1.png'),
          ),
        ),
        Positioned(top: 54.h, right: 202.w, child: AnimatedPulsingCursor()),
      ],
    );
  }

  Widget _buildStack2() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Image.asset('assets/png/training2.png', fit: BoxFit.cover),
        ),
        Positioned(
          top: 56.h,
          right: 52.w,
          child: _buildLetter('assets/png/letter2.png'),
        ),
        Positioned(top: 130.h, left: 208.w, child: AnimatedPulsingCursor()),
      ],
    );
  }

  Widget _buildStack3() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Image.asset('assets/png/training3.png', fit: BoxFit.cover),
        ),
        Positioned(
          top: 28.h,
          left: 22.w,
          child: _buildLetter('assets/png/letter3.png'),
        ),
        Positioned(top: 70.h, right: 16.w, child: AnimatedPulsingCursor()),
      ],
    );
  }

  Widget _buildStack4() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Image.asset('assets/png/training4.png', fit: BoxFit.cover),
        ),
        Positioned(top: 6.h, child: _buildLetter('assets/png/letter4.png')),
        Positioned(top: 220.h, left: 147.w, child: AnimatedPulsingCursor()),
      ],
    );
  }

  Widget _buildStack5() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Image.asset('assets/png/training5.png', fit: BoxFit.cover),
        ),
        Positioned(
          top: 40.h,
          right: 0,
          child: _buildLetter('assets/png/letter5.png', hasShadow: true),
        ),
        Positioned(top: 170.h, left: 156.w, child: HandAnimation1()),
      ],
    );
  }

  Widget _buildStack6() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Image.asset('assets/png/training6.png', fit: BoxFit.cover),
        ),
        Positioned(
          top: 64.h,
          left: 70.w,
          child: _buildLetter('assets/png/letter6.png', hasShadow: true),
        ),
        Positioned(right: 113.w, bottom: -19.h, child: AnimatedPulsingCursor()),
      ],
    );
  }

  Widget _buildStack7() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Image.asset('assets/png/training7.png', fit: BoxFit.cover),
        ),
        Positioned(
          top: 63.h,
          left: 77.w,
          child: _buildLetter('assets/png/letter7.png', hasShadow: true),
        ),
        Positioned(top: 180.h, left: 425.w, child: HandAnimation2()),
      ],
    );
  }

  Widget _buildStack8() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Image.asset('assets/png/training8.png', fit: BoxFit.cover),
        ),
        Positioned(
          top: 63.h,
          left: 77.w,
          child: _buildLetter('assets/png/letter8.png', hasShadow: true),
        ),
      ],
    );
  }

  Widget _buildStack9() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Image.asset('assets/png/training9.png', fit: BoxFit.cover),
        ),
        Positioned(
          top: 63.h,
          left: 77.w,
          child: _buildLetter('assets/png/letter9.png', hasShadow: true),
        ),
      ],
    );
  }

  Widget _buildStack10() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Center(
        child: _buildLetter(
          'assets/png/letter10.png',
          hasShadow: true,
          last: true,
        ),
      ),
    );
  }

  Widget _buildLetter(
    String letter, {
    bool hasShadow = false,
    bool last = false,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 5.r),
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (hasShadow)
                Container(
                  width: 236.r,
                  height: 270.r,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.25),
                        spreadRadius: -6,
                        blurRadius: 12,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
              Image.asset(
                letter,
                width: 270.r,
                height: 286.r,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Column(
            children: [
              LabeledButton(label: last ? "START" : "NEXT", onTap: next),
              last
                  ? SizedBox(height: 16.r * 1.2)
                  : GestureDetector(
                      onTap: skip,
                      child: Text(
                        "SKIP",
                        style: AppTextStyles.ls16.copyWith(
                          fontSize: 16.r,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }

  void next() {
    if (_currentStack == 9) {
      Navigator.of(context).pop();
      return;
    }

    _currentStack++;
    setState(() {});
  }

  void skip() {
    _currentStack = 9;
    setState(() {});
  }
}

extension WidgetKey on Widget {
  Widget copyWithKey(Key key) {
    return KeyedSubtree(key: key, child: this);
  }
}
