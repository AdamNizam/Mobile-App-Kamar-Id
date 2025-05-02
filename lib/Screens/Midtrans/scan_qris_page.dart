import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/CustomWidgets/detailstext1.dart';
import 'package:hotelbookingapp/Models/MidtransModel/result_midtrans.dart';
import 'package:hotelbookingapp/Shared/custom_methods.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';

class ScanQrisPage extends StatefulWidget {
  final ResultMidtransModel data;

  const ScanQrisPage({super.key, required this.data});

  @override
  State<ScanQrisPage> createState() => _ScanQrisPageState();
}

class _ScanQrisPageState extends State<ScanQrisPage> {
  Timer? _timer;
  Duration _remainingTime = const Duration(minutes: 15);

  @override
  void initState() {
    super.initState();
    final expiryTime = DateTime.now().add(const Duration(minutes: 15));
    _timer = CountdownTimerUtil.startCountdown(
      expiryTime: expiryTime,
      onTick: (remaining) {
        setState(() {
          _remainingTime = remaining;
        });
      },
      onExpired: () {
        _timer?.cancel();
        showExpiredDialog(
          context,
          'VA Is Expired!',
          'Your VA number has expired, please make another payment',
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                const SizedBox(height: 12),
                const Center(
                  child: Text1(
                    text1: 'Scan Your QR Code',
                    size: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.cadetGray,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.beauBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Expired time: ${formatDuration(_remainingTime)}',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: AppColors.buttonColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: AppColors.cadetGray.withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 300,
                          height: 270,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            image: DecorationImage(
                              image: NetworkImage(widget.data.actions![0].url),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 50),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: AppColors.cadetGray.withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    child: const Text(
                      'Please, align QR Code with\nthe  to make scanning\neasily detectable',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.cadetGray,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
