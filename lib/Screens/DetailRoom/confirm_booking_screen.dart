import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Blocs/chekout/checkout_bloc.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Models/CheckoutModel/chekout_model.dart';
import 'package:hotelbookingapp/Models/HotelModel/hotel_detail_model.dart';
import 'package:hotelbookingapp/Models/UserModel/user_model.dart';
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
    final test = context.read<UserModel>();
    print('usermodel ${test.toJson()}');
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
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
                      ), // Make the title stand out
                    ),
                  ],
                ),
                const SizedBox(height: 23),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            widget.dataHotel.imageId!,
                            width: 75,
                            height: 75,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Text(
                              widget.dataHotel.location!.name,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2, top: 4),
                            child: Text2(text2: widget.roomType),
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
                              Text2(
                                text2: widget.dataHotel.address ??
                                    'Address not available',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 2,
                      color: AppColors.beauBlue,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text2(text2: 'Check-In'),
                            Text1(
                              text1: DateFormat('EEEE, MMMM dd, yyyy')
                                  .format(widget.checkIn),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text2(text2: 'Check-Out'),
                            Text1(
                              text1: DateFormat('EEEE, MMMM dd, yyyy')
                                  .format(widget.checkOut),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text2(text2: 'Room Type'),
                            Text1(text1: widget.roomType),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text2(text2: 'Count of Room'),
                            Text1(text1: '${widget.room} room'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text2(text2: 'Guests'),
                            Text1(
                                text1: '${widget.adult + widget.child} people'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text2(text2: 'Price per Night'),
                            Text1(
                                text1: 'Rp${formatToRp(widget.pricePerNight)}'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text2(text2: 'Total Amount'),
                            Text1(
                              text1:
                                  'Rp${formatToRp(extractNumber(widget.totalAmount))}',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
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
                    ),
                  ),
                );
              }
              if (state is CheckoutLoading) {
                Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: AppColors.tabColor,
                    size: 30,
                  ),
                );
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  const LinearProgressIndicator(
                    value: 0.7,
                    backgroundColor: AppColors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.amberColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  CustomButton(
                    text: 'Book Now',
                    onTap: () {
                      final dataChekout = CheckoutModel(
                        code: widget.orderId,
                        firstName: 'andre',
                        lastName: 'lucmana',
                        email: 'andresetya1124@gmail.com',
                        phone: '293829798234',
                        addressLine1: 'dasd',
                        addressLine2: 'asdas',
                        city: 'Praya',
                        state: 'Indonesia',
                        zipCode: '22323',
                        country: 'ID',
                        customerNotes: 'sadasdadasdasdas',
                        paymentGateway: 'midtrans',
                        termConditions: 'on',
                        couponCode: null,
                      );

                      context.read<CheckoutBloc>().add(
                            CheckoutSubmitEvent(dataChekout),
                          );
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
}
