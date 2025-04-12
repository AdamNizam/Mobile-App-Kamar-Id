import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Shared/custom_methods.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:hotelbookingapp/Widgets/detailstext1.dart';

class VirtualNumberPage extends StatefulWidget {
  final String vaNumber;
  final String vaBankName;
  const VirtualNumberPage({
    super.key,
    required this.vaNumber,
    required this.vaBankName,
  });

  @override
  State<VirtualNumberPage> createState() => _VirtualNumberPageState();
}

class _VirtualNumberPageState extends State<VirtualNumberPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool isCopied = false;

  late DateTime expiryTime;
  Duration remainingTime = Duration.zero;
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();
    expiryTime = DateTime.now().add(const Duration(minutes: 15));
    startCountdown();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
  }

  void startCountdown() {
    countdownTimer = CountdownTimerUtil.startCountdown(
      expiryTime: expiryTime,
      onTick: (Duration diff) {
        setState(() {
          remainingTime = diff;
        });
      },
      onExpired: () {
        countdownTimer?.cancel();
        setState(() {
          remainingTime = Duration.zero;
        });
        showExpiredDialog(context, 'Expired VA Number', '');
      },
    );
  }

  void copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: widget.vaNumber));
    setState(() {
      isCopied = true;
    });
    _animationController.forward().then((_) {
      _animationController.reverse();
      showCustomSnackbar(context, 'Number is copied!');
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.white,
                    child: Center(
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColors.tabColor,
                          size: 20,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const Center(
                child: Text1(
                  text1: 'Virtual Account',
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Use the following VA number to make payment.',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: AppColors.cadetGray,
                ),
              ),
              const SizedBox(height: 28),

              // Virtual Number Container
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isCopied
                        ? AppColors.beauBlue
                        : Colors.grey.withOpacity(0.15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      spreadRadius: 2,
                      blurRadius: 10,
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 18.0,
                  horizontal: 16.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SelectableText(
                        widget.vaNumber,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    ScaleTransition(
                      scale: _scaleAnimation,
                      child: GestureDetector(
                        onTap: copyToClipboard,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: AppColors.buttonColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isCopied ? Icons.check : Icons.copy,
                            color: AppColors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              Center(
                child: Text(
                  'Copy and paste it into your payment app.',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: AppColors.cadetGray,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              Center(
                child: Text(
                  remainingTime.inSeconds > 0
                      ? 'Expires in: ${remainingTime.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(remainingTime.inSeconds.remainder(60)).toString().padLeft(2, '0')}'
                      : 'Payment expired',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: remainingTime.inSeconds > 0
                        ? AppColors.redAwesome
                        : AppColors.cadetGray,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
