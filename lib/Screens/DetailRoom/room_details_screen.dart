import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/CommonWidgets/modals/show_price_selection_modal.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Models/hotel/result_check_avaibility_model.dart';
import 'package:hotelbookingapp/Screens/DetailRoom/confirm_booking_screen.dart';
import 'package:hotelbookingapp/Shared/custom_methods.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:hotelbookingapp/Widgets/facility_icon_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RoomDetailsScreen extends StatefulWidget {
  final Room dataDetailRoom;
  final String hotelName;
  final String imageUrl;
  final String location;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final int room;
  final int adult;
  final int child;
  final String? priceRoom;

  const RoomDetailsScreen({
    super.key,
    required this.dataDetailRoom,
    required this.hotelName,
    required this.imageUrl,
    required this.checkInDate,
    required this.checkOutDate,
    required this.room,
    required this.adult,
    required this.child,
    required this.location,
    this.priceRoom,
  });

  @override
  State<RoomDetailsScreen> createState() => _RoomDetailsScreenState();
}

class _RoomDetailsScreenState extends State<RoomDetailsScreen> {
  final PageController _pageController = PageController();
  final TextEditingController _controller = TextEditingController();
  String _selectedPrice = "";

  void _updateSelectedPrice(String price) {
    setState(() {
      _selectedPrice = price;
    });
  }

  void _showList() {
    int number = widget.dataDetailRoom.number ?? 0;
    int price = widget.dataDetailRoom.price ?? 0;

    List<Map<String, String>> listRoomAndPrice = List.generate(number, (index) {
      return {
        'room': '${index + 1} ${index > 0 ? "Rooms" : "Room"}',
        'price': 'Rp${price * (index + 1)}/night',
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
                            widget.dataDetailRoom.title!,
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Enjoy a luxurious stay with world-class facilities and stunning ocean views.',
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
                            children: widget.dataDetailRoom.terms!.the8.child
                                .map((facilitiesRoom) => FacilityIconItem(
                                      icon: facilitiesRoom.icon,
                                      color: AppColors.buttonColor,
                                      title: facilitiesRoom.title,
                                    ))
                                .toList(),
                          ),
                          // const SizedBox(height: 16),
                          // Text(
                          //   'Hotel Service',
                          //   style: GoogleFonts.poppins(
                          //       fontSize: 18, fontWeight: FontWeight.bold),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _bottomBarPrice(context, widget.dataDetailRoom.price),
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
                'Rp${price.toString()}',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: AppColors.buttonColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                '/night',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.cadetGray,
                ),
              ),
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
                  Text(
                    _selectedPrice.isNotEmpty
                        ? 'Rp${formatToRp(extractNumber(_selectedPrice))}'
                        : 'Rp0',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _selectedPrice.isEmpty
                      ? AppColors.beauBlue
                      : AppColors.buttonColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
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
                  if (_selectedPrice.isEmpty) {
                    showCustomSnackbar(context, 'Youre not seleceted room');
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ConfirmBookingScreen(
                          imageUrl: widget.imageUrl,
                          hotelName: widget.hotelName,
                          location: widget.location,
                          chekIn: widget.checkInDate,
                          chekOut: widget.checkInDate,
                          roomType: widget.dataDetailRoom.title ?? 'no-data',
                          pricePerNight: widget.priceRoom ?? 'no-data',
                          guest: '',
                          totalAmount: _selectedPrice,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
