// lib/Animations/hotel_card_animation.dart

import 'package:flutter/material.dart';

class HotelCardAnimation {
  final AnimationController controller;
  final Animation<Offset> slideAnimation;
  final Animation<double> fadeAnimation;

  HotelCardAnimation._({
    required this.controller,
    required this.slideAnimation,
    required this.fadeAnimation,
  });

  factory HotelCardAnimation.init({required TickerProvider vsync}) {
    final controller = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 600),
    );

    final slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );

    final fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn,
      ),
    );

    return HotelCardAnimation._(
      controller: controller,
      slideAnimation: slideAnimation,
      fadeAnimation: fadeAnimation,
    );
  }
}
