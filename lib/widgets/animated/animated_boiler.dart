import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potion_maker/models/models.dart';

class AnimatedBoiler extends StatefulWidget {
  const AnimatedBoiler({
    super.key,
    this.type,
    this.animate = false,
    this.onAccept,
    this.onCompleted,
  });

  final bool animate;
  final PotionType? type;
  final void Function(PotionType)? onAccept;
  final VoidCallback? onCompleted;

  @override
  State<AnimatedBoiler> createState() => _AnimatedBoilerState();
}

class _AnimatedBoilerState extends State<AnimatedBoiler> {
  final _images = [
    'assets/png/big_boiler_1.png',
    'assets/png/big_boiler_2.png',
    'assets/png/big_boiler_3.png',
    'assets/png/big_boiler_4.png',
    'assets/png/big_boiler_5.png',
  ];

  final _images2 = {
    PotionType.normal: [
      "assets/png/green_bubbles_1.png",
      "assets/png/green_bubbles_2.png",
      "assets/png/green_bubbles_3.png",
      "assets/png/green_bubbles_4.png",
    ],
    PotionType.common: [
      "assets/png/red_bubbles_1.png",
      "assets/png/red_bubbles_2.png",
      "assets/png/red_bubbles_3.png",
      "assets/png/red_bubbles_4.png",
    ],
    PotionType.rare: [
      "assets/png/pink_bubbles_1.png",
      "assets/png/pink_bubbles_2.png",
      "assets/png/pink_bubbles_3.png",
      "assets/png/pink_bubbles_4.png",
    ],
    PotionType.veryRare: [
      "assets/png/purple_bubbles_1.png",
      "assets/png/purple_bubbles_2.png",
      "assets/png/purple_bubbles_3.png",
      "assets/png/purple_bubbles_4.png",
    ],
  };

  final _image2Heights = [29.r, 51.r, 144.r, 133.r];

  int _currentIndex = 0;
  int _currentBubbleIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (final path in _images) {
        precacheImage(AssetImage(path), context);
      }
      for (final list in _images2.values) {
        for (final path in list) {
          precacheImage(AssetImage(path), context);
        }
      }
    });

    _startAnimationIfNeeded();
  }

  @override
  void didUpdateWidget(covariant AnimatedBoiler oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Если animate поменялся с false → true, или type изменился — перезапускаем
    if (widget.animate != oldWidget.animate ||
        widget.type != oldWidget.type) {
      _resetAnimation();
      _startAnimationIfNeeded();
    }
  }

  void _startAnimationIfNeeded() {
    if (!widget.animate) return;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _images.length;

        if (widget.type != null) {
          final bubbles = _images2[widget.type]!;
          _currentBubbleIndex = (_currentBubbleIndex + 1) % bubbles.length;
          if (_currentBubbleIndex == bubbles.length - 1) {
            widget.onCompleted?.call();
            _timer?.cancel();
          }
        }
      });
    });
  }

  void _resetAnimation() {
    _timer?.cancel();
    _currentIndex = 0;
    _currentBubbleIndex = 0;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bubbleList = widget.type != null ? _images2[widget.type]! : null;

    return DragTarget<PotionType>(
      onAcceptWithDetails: (details) => widget.onAccept?.call(details.data),
      builder: (context, candidateData, rejectedData) {
        return SizedBox(
          width: 211.r,
          height: 380.r,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 0,
                child: Image.asset(
                  _images[_currentIndex],
                  width: 211.r,
                  height: 233.r,
                  fit: BoxFit.cover,
                ),
              ),
              if (bubbleList != null)
                Positioned(
                  bottom: 192.r,
                  child: Image.asset(
                    bubbleList[_currentBubbleIndex],
                    width: 144.r,
                    height: _image2Heights[_currentBubbleIndex],
                    fit: BoxFit.fill,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
