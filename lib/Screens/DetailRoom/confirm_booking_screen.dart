import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Blocs/chekout/checkout_bloc.dart';
import 'package:hotelbookingapp/Blocs/user/user_bloc.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Models/CheckoutModel/chekout_model.dart';
import 'package:hotelbookingapp/Models/HotelModel/hotel_detail_model.dart';
import 'package:hotelbookingapp/Screens/Midtrans/midtrans_payment_page.dart';
import 'package:hotelbookingapp/Shared/custom_methods.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:hotelbookingapp/Widgets/custombtn.dart';
import 'package:hotelbookingapp/Widgets/detailstext1.dart';
import 'package:hotelbookingapp/Widgets/detailstext2.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ConfirmBookingScreen extends StatefulWidget {
  final RowData dataHotel;
  final DateTime checkIn;
  final DateTime checkOut;
  final String roomType;
  final int room;
  final int adult;
  final int child;
  final int pricePerNight;
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
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        if (userState is UserFailed) {
          showCustomSnackbar(context, userState.error);
        }
        if (userState is UserSuccess) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                child: SingleChildScrollView(
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
                          const SizedBox(width: 50),
                          Text(
                            'Confirmation Hotel',
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 23),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 2,
                            color: AppColors.beauBlue,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                widget.dataHotel.imageId ?? '',
                                width: 75,
                                height: 75,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.dataHotel.location?.name ?? 'No Name',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 4),
                                Text2(text2: widget.roomType),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on,
                                        size: 20, color: AppColors.buttonColor),
                                    const SizedBox(width: 3),
                                    Text2(
                                        text2: widget.dataHotel.address ??
                                            'No address'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildBookingDetails(),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: BlocProvider(
                create: (context) => CheckoutBloc(),
                child: BlocConsumer<CheckoutBloc, CheckoutState>(
                  listener: (context, state) {
                    if (state is CheckoutFailed) {
                      showCustomSnackbar(context, state.error);
                    }
                    if (state is CheckoutSuccess) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MidtransPaymentPage(
                            totalPrice: int.parse(widget.totalAmount),
                            orderId: widget.orderId,
                            dataUser: userState.data,
                          ),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        state is CheckoutLoading
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.amberColor,
                                  foregroundColor: AppColors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                ),
                                onPressed: () {},
                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      LoadingAnimationWidget.fourRotatingDots(
                                        color: AppColors.white,
                                        size: 27,
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        'Proses',
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : CustomButton(
                                text: 'Book Now',
                                onTap: () {
                                  final dataChekout = CheckoutModel(
                                    code: widget.orderId,
                                    firstName: userState.data.firstName,
                                    lastName: userState.data.lastName,
                                    email: userState.data.email,
                                    phone: userState.data.phone,
                                    addressLine1: 'dasd',
                                    addressLine2: 'asdas',
                                    city: userState.data.city!,
                                    state: userState.data.state!,
                                    zipCode: userState.data.zipCode.toString(),
                                    country: userState.data.country!,
                                    customerNotes: '',
                                    paymentGateway: 'midtrans',
                                    termConditions: 'on',
                                    couponCode: null,
                                  );
                                  print(
                                      'data chekout ${jsonEncode(dataChekout.toJson())}');
                                  context
                                      .read<CheckoutBloc>()
                                      .add(CheckoutSubmitEvent(dataChekout));
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

  Widget _buildBookingDetails() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 2, color: AppColors.beauBlue),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _detailRow(
            'Check-In',
            DateFormat('EEEE, MMMM dd, yyyy').format(widget.checkIn),
          ),
          _detailRow(
            'Check-Out',
            DateFormat('EEEE, MMMM dd, yyyy').format(widget.checkOut),
          ),
          _detailRow('Room Type', widget.roomType),
          _detailRow('Count of Room', '${widget.room} room'),
          _detailRow('Guests', '${widget.adult + widget.child} people'),
          _detailRow(
              'Price per Night', 'Rp${formatToRp(widget.pricePerNight)}'),
          _detailRow('Total Amount',
              'Rp${formatToRp(extractNumber(widget.totalAmount))}'),
        ],
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text2(text2: label),
          Text1(text1: value),
        ],
      ),
    );
  }
}
