import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text2.dart';
import 'package:hotelbookingapp/Data/Models/MidtransModel/result_midtrans.dart';
import 'package:hotelbookingapp/Shared/shared_methods.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class StoreCodeAlfamartPage extends StatefulWidget {
  final ResultMidtransModel data;
  const StoreCodeAlfamartPage({
    super.key,
    required this.data,
  });

  @override
  State<StoreCodeAlfamartPage> createState() => _VirtualNumberPageState();
}

class _VirtualNumberPageState extends State<StoreCodeAlfamartPage>
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
            'Payment Code Expired!',
            'Your Payment code has expired, please make another payment.',
          );
        }
        _timer?.cancel();
      },
    );
  }

  void copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: widget.data.paymentCode!));
    setState(() {
      isCopied = true;
    });
    _animationController.forward().then((_) {
      _animationController.reverse();
      showCustomSnackbar(context, 'code is copyed!');
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
              // Back Button
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
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    const Text1(
                      text1: 'Pay Via Alfamart',
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
                  text1: 'Tunjukkan kode pembayaran ini ke kasir Alfamart',
                  size: 14,
                  color: AppColors.cadetGray),

              const SizedBox(height: 10),
              const Text1(
                  text1: 'Payment Code :',
                  size: 14,
                  color: AppColors.cadetGray),

              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                child: Row(
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
              const Text2(
                  text2: 'Cara Pembayaran:',
                  size: 16,
                  fontWeight: FontWeight.bold),
              const SizedBox(height: 10),
              ...[
                '1. Kunjungi Alfamart terdekat.',
                '2. Tunjukkan kode pembayaran ini ke kasir.',
                '3. Sebutkan bahwa kamu ingin membayar melalui Midtrans.',
                '4. Selesaikan pembayaran ${formatMidtransGrossAmount(widget.data.grossAmount)} dan simpan struk sebagai bukti.',
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
                child: Text1(
                    text1:
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
