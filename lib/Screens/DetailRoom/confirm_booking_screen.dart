import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hotelbookingapp/Blocs/chekout/checkout_bloc.dart';
import 'package:hotelbookingapp/Blocs/user/user_data/user_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomBar/customapp_top_bar.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomButton/custom_button_loading.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomButton/custombtn.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_overflow.dart';
import 'package:hotelbookingapp/Data/Models/CheckoutModel/request_chekout.dart';
import 'package:hotelbookingapp/Data/Models/HotelModel/hotel_detail_model.dart';
import 'package:hotelbookingapp/Screens/Midtrans/midtrans_payment_page.dart';
import 'package:hotelbookingapp/Screens/WebView/payment_webview.dart';
import 'package:hotelbookingapp/Shared/shared_methods.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ConfirmBookingScreen extends StatefulWidget {
  final RowData dataHotel;
  final DateTime checkIn;
  final DateTime checkOut;
  final String roomType;
  final String room;
  final int adult;
  final int child;
  final String pricePerNight;
  final String totalAmount;
  final String orderId;

  const ConfirmBookingScreen({
    super.key,
    required this.dataHotel,
    required this.checkIn,
    required this.checkOut,
    required this.roomType,
    required this.room,
    required this.adult,
    required this.child,
    required this.pricePerNight,
    required this.totalAmount,
    required this.orderId,
  });

  @override
  State<ConfirmBookingScreen> createState() => _ConfirmBookingScreenState();
}

class _ConfirmBookingScreenState extends State<ConfirmBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, userState) {
        if (userState is UserFailed) {
          showCustomSnackbar(context, userState.error);
        }
      },
      builder: (context, userState) {
        if (userState is UserSuccess) {
          return Scaffold(
            appBar: CustomAppTopBar(
              title: 'Confirm booking',
              icon: Icons.more_vert_rounded,
              onPop: () {
                Navigator.pop(context);
              },
              onTap: () {
                showCustomSnackbar(
                  context,
                  AppLocalizations.of(context)!.textFiturIsNotAvailable,
                );
              },
            ),
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 1,
                          color: AppColors.beauBlue,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: (widget.dataHotel.bannerImageId != null)
                                ? Image.network(
                                    widget.dataHotel.imageId!,
                                    width: 75,
                                    height: 75,
                                    fit: BoxFit.cover,
                                  )
                                : const SizedBox(
                                    width: 105,
                                    height: 140,
                                    child: Icon(
                                      Icons.image_rounded,
                                      size: 105,
                                      color: AppColors.beauBlue,
                                    ),
                                  ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextOverflow(
                                  text: widget.dataHotel.title ??
                                      AppLocalizations.of(context)!.textNoInfo,
                                  fontWeight: FontWeight.w600,
                                  size: 14,
                                  color: AppColors.black,
                                ),
                                const SizedBox(height: 5),
                                CustomTextOverflow(
                                  text: widget.roomType,
                                  fontWeight: FontWeight.w500,
                                  size: 13,
                                  color: AppColors.cadetGray,
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      size: 20,
                                      color: AppColors.buttonColor,
                                    ),
                                    const SizedBox(width: 3),
                                    Expanded(
                                      child: Text1(
                                        text1: widget.dataHotel.address ??
                                            AppLocalizations.of(context)!
                                                .textNoInfo,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.cadetGray,
                                        size: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 1,
                          color: AppColors.beauBlue,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _detailRow(
                            'Check-In ${widget.totalAmount}',
                            DateFormat('EEEE, MMMM dd, yyyy')
                                .format(widget.checkIn),
                          ),
                          _detailRow(
                            'Check-Out',
                            DateFormat('EEEE, MMMM dd, yyyy')
                                .format(widget.checkOut),
                          ),
                          _detailRow('Room Type', widget.roomType),
                          _detailRow('Count of Room', '${widget.room} room'),
                          _detailRow('Guests',
                              '${widget.adult + widget.child} people'),
                          _detailRow('Price per Night', widget.pricePerNight),
                          _detailRow(
                            'Total Amount',
                            'Rp${formatToRp(extractNumber(widget.totalAmount))}',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: BlocProvider(
                create: (context) => CheckoutBloc(),
                child: BlocConsumer<CheckoutBloc, CheckoutState>(
                  listener: (context, checkOutState) {
                    if (checkOutState is CheckoutSuccess) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PaymentWebView(url: checkOutState.data.url!),
                        ),
                      );
                    }

                    if (checkOutState is CheckoutFailed) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MidtransPaymentPage(
                            totalPrice: extractNumber(widget.totalAmount),
                            orderId: widget.orderId,
                            emailUser: userState.data.email,
                            firstName: userState.data.firstName,
                            lastName: userState.data.lastName,
                            phone: userState.data.phone,
                          ),
                        ),
                      );
                    }
                  },
                  builder: (context, checkOutState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        checkOutState is CheckoutLoading
                            ? const CustomButtonLoading()
                            : CustomButton(
                                text: AppLocalizations.of(context)!
                                    .textBtnConfirm,
                                onTap: () {
                                  if (userState.data.firstName != null &&
                                      userState.data.lastName != null &&
                                      userState.data.phone != null) {
                                    final dataCheckout = RequestChekout(
                                      code: widget.orderId,
                                      firstName: userState.data.firstName ?? '',
                                      lastName: userState.data.lastName ?? '',
                                      email: userState.data.email ?? '',
                                      phone: userState.data.phone ?? '',
                                      addressLine1:
                                          userState.data.address ?? '',
                                      addressLine2:
                                          userState.data.address2 ?? '',
                                      city: userState.data.city ?? '',
                                      state: userState.data.state ?? '',
                                      zipCode:
                                          userState.data.zipCode.toString(),
                                      country: userState.data.country ?? 'ID',
                                      customerNotes: '',
                                      paymentGateway: 'midtrans',
                                      termConditions: 'on',
                                      couponCode: null,
                                    );

                                    debugPrint(
                                        'data checkout: ${jsonEncode(dataCheckout.toJson())}');

                                    context
                                        .read<CheckoutBloc>()
                                        .add(CheckoutSubmitEvent(dataCheckout));
                                  } else {
                                    showCustomSnackbar(
                                      context,
                                      'Data Profile anda belum lengkap',
                                    );
                                  }
                                },
                              ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        }

        // Default loading UI jika bukan UserSuccess
        return Scaffold(
          body: Center(
            child: LoadingAnimationWidget.hexagonDots(
              color: AppColors.tabColor,
              size: 50,
            ),
          ),
        );
      },
    );
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text1(
            text1: label,
            fontWeight: FontWeight.w400,
            color: AppColors.cadetGray,
            size: 14,
          ),
          Text1(
            text1: value,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
            size: 14,
          ),
        ],
      ),
    );
  }
}
