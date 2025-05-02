import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/midtrans_payment/midtrans_payment_bloc.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomButton/custombtn.dart';
import 'package:hotelbookingapp/CustomWidgets/detailstext1.dart';
import 'package:hotelbookingapp/Models/MidtransModel/request_midtrans.dart';
import 'package:hotelbookingapp/Screens/Midtrans/credit_card_page.dart';
import 'package:hotelbookingapp/Screens/Midtrans/scan_qris_page.dart';
import 'package:hotelbookingapp/Screens/Midtrans/store_code_alfamart_page.dart';
import 'package:hotelbookingapp/Screens/Midtrans/store_code_indomaret_page.dart';
import 'package:hotelbookingapp/Screens/Midtrans/virtual_number_page.dart';
import 'package:hotelbookingapp/Shared/DataPaymentMidtrans/data.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class MidtransPaymentPage extends StatefulWidget {
  final int totalPrice;
  final String orderId;
  final String? emailUser;
  final String? firstName;
  final String? lastName;
  final String? phone;

  const MidtransPaymentPage({
    super.key,
    required this.totalPrice,
    required this.orderId,
    required this.emailUser,
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  @override
  State<MidtransPaymentPage> createState() => _MidtransPaymentPageState();
}

class _MidtransPaymentPageState extends State<MidtransPaymentPage> {
  String? selectedType = '';
  String? selectedBank;
  String? selectedStore;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MidtransPaymentBloc(),
      child: BlocConsumer<MidtransPaymentBloc, MidtransPaymentState>(
        listener: (context, state) {
          if (state is MidtransPaymentFailed) {
            showCustomSnackbar(context, state.error);
          }
          if (state is MidtransPaymentSucsess) {
            if (['qris', 'dana', 'gopay'].contains(selectedType)) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScanQrisPage(data: state.data),
                  ),
                );
              });
            }

            if (selectedType == 'shopeepay') {
              final deeplinkAction = state.data.actions?.firstWhere(
                (action) => action.name == 'deeplink-redirect',
              );
              final deeplink = deeplinkAction?.url;

              if (deeplink != null) {
                launchUrl(Uri.parse(deeplink));
              }
            }

            if (selectedType == 'bank_transfer') {
              final va = state.data.vaNumbers?.first;
              if (va?.vaNumber != null && va?.bank != null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VirtualNumberPage(data: state.data),
                    ),
                  );
                });
              }
            }

            if (selectedType == 'alfamart') {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        StoreCodeAlfamartPage(data: state.data),
                  ),
                );
              });
            }

            if (selectedType == 'Indomaret') {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        StoreCodeIndomaretPage(data: state.data),
                  ),
                );
              });
            }
          }
        },
        builder: (context, state) {
          if (state is MidtransPaymentLoading) {
            return Scaffold(
              body: Center(
                child: LoadingAnimationWidget.hexagonDots(
                  color: AppColors.tabColor,
                  size: 50,
                ),
              ),
            );
          }
          return Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  const Text1(
                    text1: "Credit Card",
                    size: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  _buildCreditCard(
                    'credit-card',
                    'Add to card',
                    'images/debitcard.png',
                    40,
                  ),
                  const Text1(
                    text1: "Bank Transfer",
                    size: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  Column(
                    children: bankData.map((bank) {
                      return _buildBank(
                        bank['code']!,
                        bank['name']!,
                        bank['logo']!,
                        bank['size']!.toDouble(),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 10),
                  const Text1(
                    text1: "E-Wallet",
                    size: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  Column(
                      children: ewalletData.map((ewalet) {
                    return _buildEwallet(
                      ewalet['code']!,
                      ewalet['name']!,
                      ewalet['logo']!,
                    );
                  }).toList()),
                  const SizedBox(height: 10),
                  const Text1(
                    text1: "CS Store",
                    size: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  Column(
                    children: csStoreData.map((store) {
                      return _buildCsStore(
                        store['code']!,
                        store['name']!,
                        store['logo']!,
                        store['size'].toDouble(),
                      );
                    }).toList(),
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
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                  CustomButton(
                    text: 'Pay Now',
                    color: selectedType == ''
                        ? AppColors.beauBlue
                        : AppColors.buttonColor,
                    onTap: () {
                      if (selectedType == '') {
                        showCustomSnackbar(
                          context,
                          'You are not selected a payment method',
                        );
                      } else if (selectedType == 'credit-card') {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CardCreditPage(),
                          ),
                        );
                      } else {
                        final dataPayment = RequestMidtrans(
                          transactionDetails: TransactionDetails(
                            orderId: widget.orderId,
                            grossAmount: widget.totalPrice,
                          ),
                          paymentType: selectedStore == 'cstore'
                              ? 'cstore'
                              : selectedType!,
                          customerDetails: CustomerDetails(
                            email: widget.emailUser ?? 'no email user',
                            firstName: widget.firstName,
                            lastName: widget.lastName,
                            phone: widget.phone,
                          ),
                          bankTransfer: selectedType! == 'bank_transfer'
                              ? BankTransfer(bank: selectedBank ?? '')
                              : null,
                          cstore: selectedStore == 'cstore'
                              ? CStore(store: selectedType!)
                              : null,
                        );

                        print(
                          'Data user Payment Midtrans: ${jsonEncode(dataPayment.toJson())}',
                        );

                        context
                            .read<MidtransPaymentBloc>()
                            .add(PayWithMidtrans(dataPayment));
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCreditCard(
    String creditKey,
    String creditName,
    String imageUrl,
    double size,
  ) {
    final bool isSelected =
        selectedType == 'credit-card' && selectedBank == creditKey;

    return Card(
      color: AppColors.white,
      elevation: 0,
      child: RadioListTile<String>(
        value: creditKey,
        groupValue: selectedBank,
        activeColor: AppColors.buttonColor,
        selected: isSelected,
        onChanged: (String? value) {
          if (value != null) {
            setState(() {
              selectedType = 'credit-card';
              selectedBank = value;
              selectedStore = null;
            });
          }
        },
        title: Row(
          children: [
            Image.asset(imageUrl, height: size),
            const SizedBox(width: 5),
            Text1(
              text1: '- $creditName',
              size: 16,
              color: AppColors.cadetGray,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBank(
      String bankKey, String bankName, String imageUrl, double size) {
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
            selectedStore = null;
          });
        },
        title: Row(
          children: [
            Image.asset(imageUrl, height: size),
            const SizedBox(width: 5),
            Text1(
              text1: '- $bankName',
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
            selectedStore = null;
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

  Widget _buildCsStore(
    String type,
    String name,
    String imageUrl,
    double size,
  ) {
    return Card(
      color: AppColors.white,
      elevation: 0,
      child: RadioListTile<String>(
        value: name,
        activeColor: AppColors.buttonColor,
        groupValue: selectedType,
        onChanged: (value) {
          setState(() {
            selectedType = value;
            selectedStore = type;
            selectedBank = null;
          });
        },
        title: Row(
          children: [
            Image.asset(imageUrl, height: size),
            const SizedBox(width: 10),
            Text1(
              text1: '- $name',
              size: 16,
              color: AppColors.cadetGray,
            ),
          ],
        ),
      ),
    );
  }
}
