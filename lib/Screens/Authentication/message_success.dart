import 'dart:ui';

import 'package:flutter/material.dart';

import '../../CustomWidgets/CustomButton/custombtn.dart';
import '../../CustomWidgets/CustomText/detailstext1.dart';
import '../../CustomWidgets/CustomText/detailstext2.dart';
import '../../Themes/colors.dart';

class MessageSuccess extends StatefulWidget {
  final String title;
  final String message;
  final String urlRoute;

  const MessageSuccess({
    super.key,
    required this.title,
    required this.message,
    required this.urlRoute,
  });

  @override
  State<MessageSuccess> createState() => _MessageSuccessState();
}

class _MessageSuccessState extends State<MessageSuccess>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 35,
                        backgroundColor: AppColors.buttonColor,
                        child: Icon(Icons.check, size: 40, color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      Text1(
                        text1: widget.title,
                        size: 20,
                      ),
                      const SizedBox(height: 10),
                      Text2(
                        text2: widget.message,
                      ),
                      const SizedBox(height: 25),
                      CustomButton(
                        text: 'Back',
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, widget.urlRoute, (route) => false);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
