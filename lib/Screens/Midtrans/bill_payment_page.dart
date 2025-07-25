import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text2.dart';
import 'package:hotelbookingapp/Data/Models/MidtransModel/result_midtrans.dart';
import 'package:hotelbookingapp/Shared/shared_methods.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class BillPaymentPage extends StatefulWidget {
  final ResultMidtransModel data;
  const BillPaymentPage({
    super.key,
    required this.data,
  });

  @override
  State<BillPaymentPage> createState() => _VirtualNumberPageState();
}

class _VirtualNumberPageState extends State<BillPaymentPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool isCopiedCode = false;
  bool isCopiedID = false;

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
            'Payment Code Expired!',
            'Your Payment code has expired, please make another payment.',
          );
        }
        _timer?.cancel();
      },
    );
  }

  void copyToClipboardCode() async {
    await Clipboard.setData(ClipboardData(text: widget.data.paymentCode!));
    setState(() {
      isCopiedCode = true;
    });
    _animationController.forward().then((_) {
      _animationController.reverse();
      showCustomSnackbar(context, 'Code is copyed!');
    });
  }

  void copyToClipboardID() async {
    await Clipboard.setData(ClipboardData(text: widget.data.paymentCode!));
    setState(() {
      isCopiedID = true;
    });
    _animationController.forward().then((_) {
      _animationController.reverse();
      showCustomSnackbar(context, 'ID Merchant is copyed!');
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
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.buttonColor,
                        size: 20,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    const Text1(
                      text1: 'Bill Mandiri payment ',
                      size: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
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
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Instruction
              const Text1(
                  text1:
                      'Please copy this number, and paste it into your payment BANK.',
                  size: 14,
                  color: AppColors.cadetGray),

              const SizedBox(height: 10),
              const Text1(
                  text1: 'Biller Code:', size: 14, color: AppColors.cadetGray),

              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 2,
                    color: isCopiedID ? AppColors.beauBlue : AppColors.white,
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SelectableText(
                            widget.data.paymentCode ?? '',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        ScaleTransition(
                          scale: _scaleAnimation,
                          child: GestureDetector(
                            onTap: copyToClipboardCode,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: AppColors.buttonColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                isCopiedCode ? Icons.check : Icons.copy,
                                color: AppColors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text1(
                  text1: 'Bill key:', size: 14, color: AppColors.cadetGray),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 2,
                    color: isCopiedID ? AppColors.beauBlue : AppColors.white,
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SelectableText(
                            widget.data.merchantId ?? '',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        ScaleTransition(
                          scale: _scaleAnimation,
                          child: GestureDetector(
                            onTap: copyToClipboardID,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: AppColors.buttonColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                isCopiedID ? Icons.check : Icons.copy,
                                color: AppColors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              const Text2(
                  text2: 'Cara Pembayaran:',
                  size: 16,
                  fontWeight: FontWeight.bold),

              const SizedBox(height: 10),
              ...[
                '1. Buka aplikasi mobile banking anda',
                '2. Pilih menu pembayaran dengan Virtual Account.',
                '3. Masukkan nomor Virtual Account di atas.',
                '4. Selesaikan pembayaran ${formatMidtransGrossAmount(widget.data.grossAmount)}',
              ].map(
                (step) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text2(
                    text2: step,
                    size: 14,
                    color: AppColors.cadetGray,
                  ),
                ),
              ),

              const Spacer(),
              Center(
                child: Text2(
                    text2:
                        '*Kode ini hanya bisa digunakan satu kali dan akan kedaluwarsa dalam waktu yang tertera di atas.',
                    size: 12,
                    color: Colors.grey.shade500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
