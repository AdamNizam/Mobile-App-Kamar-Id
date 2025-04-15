import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Blocs/booking/booking_bloc.dart';
import 'package:hotelbookingapp/Blocs/user/user_bloc.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Models/BookingModel/add_to_chart_model.dart';
import 'package:hotelbookingapp/Models/HotelModel/hotel_detail_model.dart';
import 'package:hotelbookingapp/Models/ResponseResultModel/result_check_avaibility.dart';
import 'package:hotelbookingapp/Screens/Midtrans/midtrans_payment_page.dart';
import 'package:hotelbookingapp/Shared/custom_methods.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:hotelbookingapp/Widgets/custombtn.dart';
import 'package:hotelbookingapp/Widgets/detailstext1.dart';
import 'package:hotelbookingapp/Widgets/detailstext2.dart';
import 'package:intl/intl.dart';

class ConfirmBookingScreen extends StatefulWidget {
  final RoomChekAvaibility dataRoom;
  final RowData dataHotel;
  final DateTime chekIn;
  final DateTime chekOut;
  final String roomType;
  final int adult;
  final int child;
  final int pricePerNight;
  final String totalAmount;

  const ConfirmBookingScreen({
    super.key,
    required this.dataRoom,
    required this.dataHotel,
    required this.chekIn,
    required this.chekOut,
    required this.roomType,
    required this.adult,
    required this.child,
    required this.pricePerNight,
    required this.totalAmount,
  });

  @override
  State<ConfirmBookingScreen> createState() => _ConfirmBookingScreenState();
}

class _ConfirmBookingScreenState extends State<ConfirmBookingScreen> {
  @override
  Widget build(BuildContext context) {
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
                              widget.dataHotel.title!,
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
                              text1: DateFormat('MMMM dd, yyyy')
                                  .format(widget.chekIn),
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
                              text1: DateFormat('MMMM dd, yyyy')
                                  .format(widget.chekOut),
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
                            const Text2(text2: 'Guests'),
                            Text1(text1: '${widget.adult + widget.child}'),
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
                            const Text2(text2: 'Servie Fee'),
                            Text(
                              'Rp${widget.dataHotel.serviceFee?.isNotEmpty == true ? widget.dataHotel.serviceFee!.first.price : '0'}',
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text2(text2: 'Cleanliness'),
                            Text1(text1: 'Rp20.000'),
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
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (state is UserFailed) {
                        showCustomSnackbar(context, state.error);
                      }

                      if (state is UserSuccess) {
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Text2(
                                text2: 'Edit Data',
                                color: AppColors.buttonColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text2(text2: 'Full Name'),
                                  Text1(text1: state.data.name),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text2(text2: 'Fist Name'),
                                  Text1(text1: state.data.firstName),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text2(text2: 'Last Name'),
                                  Text1(text1: state.data.lastName),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text2(text2: 'Email'),
                                  Text1(text1: state.data.email),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text2(text2: 'Phone Number'),
                                  Text1(text1: state.data.phone),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text2(text2: 'Address'),
                                  Flexible(
                                    child: Text1(
                                      text1: state.data.address ?? '',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text2(text2: 'Post Code'),
                                  Text1(text1: state.data.zipCode ?? ''),
                                ],
                              ),
                            ),
                          ],
                        );
                      }

                      return Container();
                    },
                  ),
                )
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
          create: (context) => BookingBloc(),
          child: BlocConsumer<BookingBloc, BookingState>(
              listener: (context, state) {
            if (state is BookingSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MidtransPaymentPage(
                    totalPrice: int.parse(widget.totalAmount),
                    orderId: state.data.bookingCode,
                  ),
                ),
              );
            }
            if (state is BookingFailed) {
              showCustomSnackbar(context, state.error);
            }
          }, builder: (context, state) {
            return CustomButton(
              text: 'Book Now',
              onTap: () {
                final cartModel = AddToCartModel(
                  serviceId: '11',
                  serviceType: 'hotel',
                  startDate: formatDateToYMD(widget.chekIn),
                  endDate: formatDateToYMD(widget.chekOut),
                  extraPrice: [
                    ExtraPriceBooking(
                      name: "Service VIP",
                      nameEn: null,
                      price: "200",
                      type: "one_time",
                      number: "0",
                      enable: "1",
                      priceHtml: "Rp200",
                      priceType: null,
                    ),
                    ExtraPriceBooking(
                      name: "Breakfasts",
                      nameEn: null,
                      price: "100",
                      type: "one_time",
                      number: "0",
                      enable: "1",
                      priceHtml: "Rp100",
                      priceType: null,
                    ),
                  ],
                  adults: widget.adult.toString(),
                  children: widget.child.toString(),
                  rooms: [
                    Room(id: '41', numberSelected: '1'),
                    Room(id: '42', numberSelected: '1'),
                    Room(id: '43', numberSelected: '1'),
                    Room(id: '44', numberSelected: '1'),
                  ],
                );
                context.read<BookingBloc>().add(AddToCartEvent(cartModel));
              },
            );
          }),
        ),
      ),
    );
  }
}
