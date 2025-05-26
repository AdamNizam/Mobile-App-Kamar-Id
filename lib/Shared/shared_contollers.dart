import 'dart:async';

import 'package:flutter/widgets.dart';

class AutoSliderController {
  final PageController pageController;
  final int itemCount;
  final Duration interval;
  final Duration animationDuration;
  final Curve animationCurve;

  Timer? _timer;
  int _currentPage = 0;

  AutoSliderController({
    required this.pageController,
    required this.itemCount,
    this.interval = const Duration(seconds: 4),
    this.animationDuration = const Duration(milliseconds: 500),
    this.animationCurve = Curves.easeInOut,
  });

  void start() {
    _timer = Timer.periodic(interval, (timer) {
      if (!pageController.hasClients) return;

      _currentPage = (_currentPage + 1) % itemCount;
      pageController.animateToPage(
        _currentPage,
        duration: animationDuration,
        curve: animationCurve,
      );
    });
  }

  void dispose() {
    _timer?.cancel();
  }
}
