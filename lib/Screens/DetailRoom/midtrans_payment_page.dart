import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/midtrans_payment/midtrans_payment_bloc.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:hotelbookingapp/Widgets/custombtn.dart';
import 'package:hotelbookingapp/Widgets/detailstext1.dart';

class MidtransPaymentPage extends StatefulWidget {
  const MidtransPaymentPage({super.key});

  @override
  State<MidtransPaymentPage> createState() => _MidtransPaymentPageState();
}

class _MidtransPaymentPageState extends State<MidtransPaymentPage> {
  String? selectedType;
  String? selectedBank;
  final int totalPrice = 50000;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MidtransPaymentBloc(),
      child: Scaffold(
        body: BlocConsumer<MidtransPaymentBloc, MidtransPaymentState>(
          listener: (context, state) {
            if (state is MidtransPaymentFailed) {
              print('error payment : ${state.error}');
              showCustomSnackbar(context, state.error);
            }
            if (state is MidtransPaymentSucsess) {
              showCustomSnackbar(context, 'Payment Success');
            }
          },
          builder: (context, state) {
            final result =
                state is MidtransPaymentSucsess ? state.result : null;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  const Text("Bank Transfer",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  _buildBankTile('bni', 'BNI', 'images/Logo-BNI.png'),
                  _buildBankTile('bca', 'BCA', 'images/Logo-BCA.png'),
                  _buildBankTile(
                      'mandiri', 'Mandiri', 'images/Logo-Mandiri.png'),
                  const SizedBox(height: 10),
                  const Text("E-Wallet",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  _buildEwalletTile('gopay', 'Gopay', 'images/Logo-GoPay.png'),
                  _buildEwalletTile('dana', 'DANA', 'images/Logo-DANA.png'),
                  const Text("QRIS",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  _buildEwalletTile('qris', 'QR Code', 'images/Logo-Qris.png'),
                  const SizedBox(height: 10),
                  if (state is MidtransPaymentLoading)
                    const Center(child: CircularProgressIndicator()),
                  if (result != null) buildResult(result),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: Builder(
          builder: (ctx) => _buildBottomBar(ctx),
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total Payment",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              Text("Rp $totalPrice",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 10),
          CustomButton(
            text: 'Pay Now',
            onTap: () {
              if (selectedType == null ||
                  (selectedType == 'bank_transfer' && selectedBank == null)) {
                showCustomSnackbar(context, 'select your payment method');
                return;
              }

              context.read<MidtransPaymentBloc>().add(
                    PayNowPressed(
                      selectedType: selectedType!,
                      selectedBank: selectedBank ?? '',
                      totalPrice: totalPrice,
                    ),
                  );
            },
          ),
        ],
      ),
    );
  }

  Widget buildResult(Map<String, dynamic> result) {
    if (selectedType == 'qris') {
      final qrUrl = result['actions']
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
      final deeplink = result['actions']
          ?.firstWhere((a) => a['name'] == 'deeplink-redirect')['url'];
      return SelectableText("Bayar via eWallet:\n$deeplink");
    }

    if (selectedType == 'bank_transfer') {
      final va = result['va_numbers']?[0]?['va_number'];
      final bank = result['va_numbers']?[0]?['bank'];
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Text("Virtual Account",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text("Bank: ${bank?.toUpperCase() ?? '-'}"),
          Row(
            children: [
              Expanded(child: SelectableText("No. VA: $va")),
              IconButton(
                icon: const Icon(Icons.copy),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: va));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Nomor VA disalin')),
                  );
                },
              ),
            ],
          ),
        ],
      );
    }
    return const Text("Transaksi berhasil");
  }

  Widget _buildBankTile(String bankKey, String bankName, String imageUrl) {
    bool isSelected =
        selectedType == 'bank_transfer' && selectedBank == bankKey;
    return Card(
      color: AppColors.white,
      elevation: 0,
      child: RadioListTile<String>(
        value: bankKey,
        activeColor: AppColors.buttonColor,
        groupValue: selectedBank,
        onChanged: (value) {
          setState(() {
            selectedType = 'bank_transfer';
            selectedBank = value;
          });
        },
        title: Row(
          children: [
            Image.asset(imageUrl, height: 24),
            const SizedBox(width: 10),
            Text1(
                text1: '- Bank $bankName',
                size: 16,
                color: AppColors.cadetGray),
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
      child: RadioListTile<String>(
        value: type,
        activeColor: AppColors.buttonColor,
        groupValue: selectedType,
        onChanged: (value) {
          setState(() {
            selectedType = value;
            selectedBank = null;
          });
        },
        title: Row(
          children: [
            Image.asset(imageUrl, height: 24),
            const SizedBox(width: 10),
            Text1(text1: name, size: 16, color: AppColors.cadetGray),
          ],
        ),
      ),
    );
  }
}
