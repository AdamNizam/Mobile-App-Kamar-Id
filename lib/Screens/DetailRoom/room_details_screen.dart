import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Blocs/booking/booking_bloc.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomIcon/facility_icon_item.dart';
import 'package:hotelbookingapp/CustomWidgets/ModalSelection/show_price_selection_modal.dart';
import 'package:hotelbookingapp/CustomWidgets/detailstext1.dart';
import 'package:hotelbookingapp/Models/BookingModel/request_add_to_chart.dart';
import 'package:hotelbookingapp/Models/HotelModel/hotel_detail_model.dart';
import 'package:hotelbookingapp/Models/HotelModel/result_check_avaibility.dart';
import 'package:hotelbookingapp/Screens/DetailRoom/confirm_booking_screen.dart';
import 'package:hotelbookingapp/Shared/custom_methods.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RoomDetailsScreen extends StatefulWidget {
  final RoomChekAvaibility dataRoom;
  final RowData dataHotel;
  final DateTime checkIn;
  final DateTime checkOut;
  final int room;
  final int adult;
  final int child;
  final int priceRoom;

  const RoomDetailsScreen({
    super.key,
    required this.dataRoom,
    required this.dataHotel,
    required this.checkIn,
    required this.checkOut,
    required this.room,
    required this.adult,
    required this.child,
    required this.priceRoom,
  });

  @override
  State<RoomDetailsScreen> createState() => _RoomDetailsScreenState();
}

class _RoomDetailsScreenState extends State<RoomDetailsScreen> {
  final PageController _pageController = PageController();
  final TextEditingController _controller = TextEditingController();
  String selectedPrice = '';
  String numberSelected = '';

  void _updateSelectedPrice(String price, String number) {
    setState(() {
      selectedPrice = price;
      numberSelected = number;
    });
  }

  void _showList() {
    int number = widget.dataRoom.number ?? 0;
    int price = widget.dataRoom.price ?? 0;

    List<Map<String, String>> listRoomAndPrice = List.generate(number, (index) {
      return {
        'room': '${index + 1} ${index > 0 ? "Rooms" : "Room"}',
        'number': '${index + 1}',
        'price': '${price * (index + 1)}',
        'nights': countNights(widget.checkIn, widget.checkOut),
      };
    });

    showPriceRoomModal(
      context: context,
      controller: _controller,
      priceRoom: listRoomAndPrice,
      onSelectPrice: _updateSelectedPrice,
    );
  }

  final List<String> _imageUrls = [
    'https://picsum.photos/800/400?random=1',
    'https://picsum.photos/800/400?random=2',
    'https://picsum.photos/800/400?random=3',
    'https://picsum.photos/800/400?random=4',
    'https://picsum.photos/800/400?random=5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 250,
                          width: double.infinity,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: _imageUrls.length,
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                child: Image.network(
                                  _imageUrls[index],
                                  height: 250,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 16,
                          child: iconBackButton(Icons.arrow_back, () {
                            Navigator.pop(context);
                          }),
                        ),
                        Positioned(
                          bottom: 16,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: SmoothPageIndicator(
                              controller: _pageController,
                              count: _imageUrls.length,
                              effect: ExpandingDotsEffect(
                                dotHeight: 8,
                                dotWidth: 8,
                                activeDotColor: AppColors.white,
                                dotColor: AppColors.white.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.dataRoom.title!,
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            ' ${widget.dataRoom.id} -- $numberSelected -- Enjoy a luxurious stay with world-class facilities and stunning ocean views.',
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Facilities Room',
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: widget.dataRoom.terms!.the8.child
                                .map((facilitiesRoom) => FacilityIconItem(
                                      icon: facilitiesRoom.icon,
                                      color: AppColors.buttonColor,
                                      title: facilitiesRoom.title,
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _bottomBarPrice(context, widget.dataRoom.price),
          ],
        ),
      ),
    );
  }

  Widget iconBackButton(IconData icon, VoidCallback onTap,
      {Color color = AppColors.black}) {
    return CircleAvatar(
      backgroundColor: AppColors.white.withOpacity(0.8),
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: onTap,
      ),
    );
  }

  Widget _bottomBarPrice(BuildContext context, int price) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Rp${formatToRp(price)}',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: AppColors.buttonColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text1(
                text1: countNights(
                  widget.checkIn,
                  widget.checkOut,
                ),
                size: 14,
                fontWeight: FontWeight.w400,
              )
            ],
          ),
          TextFormField(
            controller: _controller,
            readOnly: true,
            decoration: const InputDecoration(
              labelText: "Select Room",
              labelStyle: TextStyle(color: AppColors.buttonColor),
              suffixIcon: Icon(Icons.arrow_drop_down),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.buttonColor,
                  width: 2,
                ),
              ),
            ),
            onTap: _showList,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Price :',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: AppColors.cadetGray,
                    ),
                  ),
                  Text1(
                    text1: selectedPrice.isNotEmpty
                        ? 'Rp${formatToRp(extractNumber(selectedPrice))}'
                        : 'Rp0',
                    size: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              BlocProvider(
                create: (context) => BookingBloc(),
                child: BlocConsumer<BookingBloc, BookingState>(
                  listener: (context, state) {
                    if (state is BookingFailed) {
                      showCustomSnackbar(context, state.error);
                    }
                    if (state is BookingSuccess) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfirmBookingScreen(
                            dataHotel: widget.dataHotel,
                            checkIn: widget.checkIn,
                            checkOut: widget.checkOut,
                            roomType: widget.dataRoom.title!,
                            room: widget.room,
                            adult: widget.adult,
                            child: widget.child,
                            pricePerNight: widget.priceRoom,
                            totalAmount: selectedPrice,
                            orderId: state.data.bookingCode,
                          ),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedPrice.isEmpty
                            ? AppColors.beauBlue
                            : AppColors.buttonColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        'Confirm',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                      onPressed: () {
                        final dataCart = RequestAddToChart(
                          serviceId: widget.dataHotel.id.toString(),
                          serviceType: 'hotel',
                          startDate: formatDateToYMD(widget.checkIn),
                          endDate: formatDateToYMD(widget.checkOut),
                          extraPrice:
                              (widget.dataHotel.extraPrice as List).map((ep) {
                            return ExtraPriceBooking(
                              name: ep.name,
                              nameEn: ep.nameEn,
                              price: ep.price,
                              type: ep.type,
                              number: "0",
                              enable: "1",
                              priceHtml: "Rp${ep.price}",
                              priceType: null,
                            );
                          }).toList(),
                          adults: widget.adult.toString(),
                          children: widget.child.toString(),
                          rooms: [
                            Room(
                              id: widget.dataRoom.id.toString(),
                              numberSelected: numberSelected,
                            ),
                          ],
                        );

                        print('data Cart: ${jsonEncode(dataCart)}');

                        context
                            .read<BookingBloc>()
                            .add(AddToCartEvent(dataCart));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
