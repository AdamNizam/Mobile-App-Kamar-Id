import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/Data/Models/MidtransModel/result_midtrans.dart';
import 'package:hotelbookingapp/Shared/shared_methods.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class VirtualNumberPage extends StatefulWidget {
  final ResultMidtransModel data;
  const VirtualNumberPage({
    super.key,
    required this.data,
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
  Timer? _timer;
  Duration _remainingTime = const Duration(minutes: 15);

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
    _timer = CountdownTimerUtil.startCountdown(
      expiryTime: expiryTime,
      onTick: (remaining) {
        setState(() {
          _remainingTime = remaining;
        });
      },
      onExpired: () {
        if (widget.data.transactionStatus.toLowerCase() == 'pending') {
          showExpiredDialog(
            context,
            'Qris Code Expired!',
            'Your QR code has expired, please make another payment.',
          );
        }
        _timer?.cancel();
      },
    );
  }

  void copyToClipboard() async {
    await Clipboard.setData(
        ClipboardData(text: widget.data.vaNumbers!.first.vaNumber));
    setState(() {
      isCopied = true;
    });
    _animationController.forward().then((_) {
      _animationController.reverse();
      showCustomSnackbar(context, 'Number is copyed!');
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer?.cancel();
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
              Center(
                child: Column(
                  children: [
                    const Text1(
                      text1: 'Virtual Account',
                      size: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.beauBlue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text1(
                        text1:
                            'Expired time: ${formatDuration(_remainingTime)}',
                        size: 14,
                        color: AppColors.buttonColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text1(
                text1:
                    'Please copy this number, and paste it into your payment BANK ',
                size: 14,
                color: AppColors.cadetGray,
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 2,
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
                        widget.data.vaNumbers!.first.vaNumber,
                        style: const TextStyle(
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
              const Text1(
                text1: 'Cara Pembayaran:',
                size: 16,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 10),
              ...[
                '1. Buka aplikasi mobile banking anda',
                '2. Pilih menu pembayaran dengan Virtual Account.',
                '3. Masukkan nomor Virtual Account di atas.',
                '4. Selesaikan pembayaran ${formatMidtransGrossAmount(widget.data.grossAmount)}',
              ].map(
                (step) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text1(
                    text1: step,
                    size: 14,
                    color: AppColors.cadetGray,
                  ),
                ),
              ),
              const Spacer(),
              Text1(
                text1:
                    '*VA number ini hanya bisa digunakan satu kali dan akan kedaluwarsa dalam waktu yang tertera di atas.',
                size: 12,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
