// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Widgets/custombtn.dart';
import 'package:http/http.dart' as http;

class MidtransPaymentPage extends StatefulWidget {
  const MidtransPaymentPage({super.key});

  @override
  State<MidtransPaymentPage> createState() => _MidtransPaymentPageState();
}

class _MidtransPaymentPageState extends State<MidtransPaymentPage> {
  String? selectedType;
  String? selectedBank;
  bool isLoading = false;
  Map<String, dynamic>? result;

  final int totalPrice = 50000;
  final serverKey = 'SB-Mid-server-04Ukt2P7mZjxUFy-NQYZV5XH';

  Future<void> payNow() async {
    if (selectedType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Pilih metode pembayaran terlebih dahulu")),
      );
      return;
    }

    setState(() {
      isLoading = true;
      result = null;
    });

    final orderId = "ORDER-${DateTime.now().millisecondsSinceEpoch}";
    final basicAuth = 'Basic ${base64Encode(utf8.encode('$serverKey:'))}';

    Map<String, dynamic> body = {
      "transaction_details": {
        "order_id": orderId,
        "gross_amount": totalPrice,
      },
      "payment_type": selectedType,
    };

    if (selectedType == 'bank_transfer') {
      body["bank_transfer"] = {"bank": selectedBank};
    }

    final response = await http.post(
      Uri.parse('https://api.sandbox.midtrans.com/v2/charge'),
      headers: {
        'Authorization': basicAuth,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    setState(() => isLoading = false);

    if (response.statusCode == 201) {
      setState(() {
        result = jsonDecode(response.body);
      });
    } else {
      print('Gagal: ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Gagal membuat transaksi")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.white,
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
                const Expanded(
                  child: Center(
                    child: Text(
                      'Pembayaran',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 40),
              ],
            ),
            const SizedBox(height: 23),
            const Text(
              "Bank Transfer",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildBankTile('bni', 'BNI', 'images/BNI-logo.svg'),
            _buildBankTile('bri', 'BRI', 'images/BRI-logo.svg'),
            _buildBankTile('bsi', 'BSI', 'images/BSI-logo.svg'),
            const SizedBox(height: 20),
            const Text(
              "E-Wallet",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildEwalletTile('dana', 'DANA', 'images/DANA-logo.svg'),
            _buildEwalletTile('gopay', 'GoPay', 'images/GoPay-logo.svg'),
            _buildEwalletTile(
                'shoppepay', 'ShoppePay', 'images/ShoppePay-logo.svg'),
            const SizedBox(height: 20),
            const Text("QRIS",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _buildEwalletTile(
                'qris', 'QR Code (QRIS)', 'images/Qris-pay-logo.svg'),
            const SizedBox(height: 20),
            buildResult(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total Payment",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                Text(
                  "Rp ${totalPrice.toString()}/IDR",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomButton(
              text: isLoading ? 'Memproses...' : 'Pay Now',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget buildResult() {
    if (result == null) return const SizedBox.shrink();

    if (selectedType == 'qris') {
      final qrUrl = result?['actions']
          ?.firstWhere((a) => a['name'] == 'generate-qr-code')['url'];
      return Column(
        children: [
          const Text("Scan QR Berikut:"),
          const SizedBox(height: 10),
          Image.network(qrUrl, height: 200),
        ],
      );
    }

    if (['gopay', 'shopeepay', 'dana'].contains(selectedType)) {
      final deeplink = result?['actions']
          ?.firstWhere((a) => a['name'] == 'deeplink-redirect')['url'];
      return SelectableText("Bayar via eWallet:\n$deeplink");
    }

    if (selectedType == 'bank_transfer') {
      final va = result?['va_numbers']?[0]?['va_number'];
      final bank = result?['va_numbers']?[0]?['bank'];
      return SelectableText("VA $bank:\n$va");
    }

    return const SelectableText("Transaksi berhasil dibuat");
  }

  Widget _buildBankTile(String bankKey, String bankName, String imageUrl) {
    bool isSelected =
        selectedType == 'bank_transfer' && selectedBank == bankKey;

    return Card(
      color: AppColors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
          color: AppColors.beauBlue,
          width: 1.5,
        ),
      ),
      child: RadioListTile<String>(
        value: bankKey,
        activeColor: AppColors.tabColor,
        groupValue: selectedBank,
        onChanged: (value) {
          setState(() {
            selectedType = 'bank_transfer';
            selectedBank = value;
          });
        },
        title: Row(
          children: [
            SvgPicture.asset(
              imageUrl,
              height: 24,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
            Text(bankName),
          ],
        ),
        selected: isSelected,
      ),
    );
  }

  Widget _buildEwalletTile(String type, String name, String imageUrl) {
    return Card(
      color: AppColors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
          color: AppColors.beauBlue,
          width: 1.5,
        ),
      ),
      child: RadioListTile<String>(
        value: type,
        activeColor: AppColors.tabColor,
        groupValue: selectedType,
        onChanged: (value) {
          setState(() {
            selectedType = value;
            selectedBank = null;
          });
        },
        title: Row(
          children: [
            SvgPicture.asset(
              imageUrl,
              height: 24,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
            Text(name),
          ],
        ),
        selected: selectedType == type,
      ),
    );
  }
}
