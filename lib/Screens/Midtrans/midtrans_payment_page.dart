import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/midtrans_payment/midtrans_payment_bloc.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Screens/Midtrans/scan_qris_page.dart';
import 'package:hotelbookingapp/Screens/Midtrans/virtual_number_page.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:hotelbookingapp/Widgets/custombtn.dart';
import 'package:hotelbookingapp/Widgets/detailstext1.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MidtransPaymentPage extends StatefulWidget {
  final int totalPrice;
  const MidtransPaymentPage({
    super.key,
    required this.totalPrice,
  });

  @override
  State<MidtransPaymentPage> createState() => _MidtransPaymentPageState();
}

class _MidtransPaymentPageState extends State<MidtransPaymentPage> {
  String? selectedType;
  String? selectedBank;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MidtransPaymentBloc(),
      child: Scaffold(
        body: BlocConsumer<MidtransPaymentBloc, MidtransPaymentState>(
          listener: (context, state) {
            if (state is MidtransPaymentFailed) {
              showCustomSnackbar(context, state.error);
            }
            if (state is MidtransPaymentSucsess) {
              if (selectedType == 'qris' || selectedType == 'gopay') {
                final qrUrl = state.data.actions
                    ?.firstWhere((qr) => qr.name == 'generate-qr-code')
                    .url;
                if (qrUrl != null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScanQrisPage(data: state.data),
                      ),
                    );
                  });
                }
              }
              if (selectedType == 'bank_transfer') {
                final va = state.data.vaNumbers?.first.vaNumber;
                final bank = state.data.vaNumbers?.first.bank;

                if (va != null && bank != null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            VirtualNumberPage(data: state.data),
                      ),
                    );
                  });
                }
              }
            }
          },
          builder: (context, state) {
            if (state is MidtransPaymentLoading) {
              return Center(
                child: LoadingAnimationWidget.hexagonDots(
                  color: AppColors.tabColor,
                  size: 50,
                ),
              );
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  const Text1(
                    text1: "Bank Transfer",
                    size: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  _buildBank(
                    'bni',
                    'BNI',
                    'images/Logo-BNI.png',
                  ),
                  _buildBank(
                    'bca',
                    'BCA',
                    'images/Logo-BCA.png',
                  ),
                  _buildBank(
                    'bri',
                    'BRI',
                    'images/Logo-BRI.png',
                  ),
                  const SizedBox(height: 10),
                  const Text1(
                    text1: "E-Wallet",
                    size: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  _buildEwallet(
                    'gopay',
                    'Gopay',
                    'images/Logo-GoPay.png',
                  ),
                  const SizedBox(height: 10),
                  const Text1(
                    text1: "QRIS",
                    size: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  _buildEwallet(
                    'qris',
                    'QR Code',
                    'images/Logo-Qris.png',
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: Builder(
          builder: (context) => _buildBottomBar(context),
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
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text1(
                text1: "Total Payment",
                size: 16,
                fontWeight: FontWeight.bold,
              ),
              Text1(
                text1: "Rp ${widget.totalPrice}",
                size: 16,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          const SizedBox(height: 10),
          (selectedType == null ||
                  (selectedType == 'bank_transfer' && selectedBank == null))
              ? CustomButton(
                  text: 'Pay Now',
                  color: AppColors.beauBlue,
                  onTap: () {
                    showCustomSnackbar(
                      context,
                      'Select your payment method',
                    );
                  },
                )
              : CustomButton(
                  text: 'Pay Now',
                  onTap: () {
                    context.read<MidtransPaymentBloc>().add(
                          PayNowPressed(
                            selectedType: selectedType!,
                            selectedBank: selectedBank ?? '',
                            totalPrice: widget.totalPrice,
                            customerEmail: '',
                          ),
                        );
                  },
                ),
        ],
      ),
    );
  }

  Widget _buildBank(String bankKey, String bankName, String imageUrl) {
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
              color: AppColors.cadetGray,
            ),
          ],
        ),
        selected: isSelected,
      ),
    );
  }

  Widget _buildEwallet(
    String type,
    String name,
    String imageUrl,
  ) {
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
            Text1(text1: '- $name', size: 16, color: AppColors.cadetGray),
          ],
        ),
      ),
    );
  }
}
