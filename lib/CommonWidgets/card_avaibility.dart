import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Models/ResponseResult/result_check_avaibility.dart';
import 'package:hotelbookingapp/Screens/DetailRoom/room_details_screen.dart';
import 'package:hotelbookingapp/Shared/custom_methods.dart';
import 'package:hotelbookingapp/Widgets/custom_icon1_avaibility.dart';
import 'package:hotelbookingapp/Widgets/custom_icon2_avaibility.dart';
import 'package:hotelbookingapp/Widgets/detailstext1.dart';

class CardAvailbility extends StatefulWidget {
  final Room data;
  final String hotelName;
  final String imageUrl;
  final String location;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final int room;
  final int adult;
  final int child;

  const CardAvailbility({
    super.key,
    required this.data,
    required this.hotelName,
    required this.imageUrl,
    required this.checkInDate,
    required this.checkOutDate,
    required this.room,
    required this.adult,
    required this.child,
    required this.location,
  });

  @override
  CardAvailbilityState createState() => CardAvailbilityState();
}

class CardAvailbilityState extends State<CardAvailbility> {
  bool isSelected = false;

  void toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RoomDetailsScreen(
              dataDetailRoom: widget.data,
              hotelName: widget.hotelName,
              imageUrl: widget.imageUrl,
              location: widget.location,
              checkInDate: widget.checkInDate,
              checkOutDate: widget.checkOutDate,
              priceRoom: widget.data.price,
              room: widget.room,
              adult: widget.adult,
              child: widget.child,
            ),
          ),
        );
      },
      child: Card(
        color: AppColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: isSelected ? AppColors.beauBlue : AppColors.strokColor,
            width: 2,
          ),
        ),
        child: Container(
          width: 330,
          padding: const EdgeInsets.all(4.0),
          margin: const EdgeInsets.all(2.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(9),
                child:
                    (widget.data.image != false && widget.data.image.isNotEmpty)
                        ? Image.network(
                            widget.data.image,
                            width: 105,
                            height: 140,
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
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Column(
                        children: [
                          Text(
                            widget.data.title ?? "No-Data",
                            style: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Row(
                        children: [
                          Text(
                            'Rp${formatToRp(widget.data.price)}',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.buttonColor,
                            ),
                          ),
                          Text1(
                            text1: countNights(
                              widget.checkInDate,
                              widget.checkOutDate,
                            ),
                            size: 14,
                            fontWeight: FontWeight.w400,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        CustomIcon1Avaibility(
                          icon: Icons.apartment,
                          title: '200 m2',
                        ),
                        CustomIcon1Avaibility(
                          icon: Icons.surfing,
                          title: 'x2',
                        ),
                        CustomIcon1Avaibility(
                          icon: Icons.family_restroom,
                          title: 'x5',
                        ),
                        CustomIcon1Avaibility(
                          icon: Icons.settings_accessibility,
                          title: 'x5',
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: widget.data.termFeatures!.map(
                          (data) {
                            return CustomIcon2Avaibility(data: data);
                          },
                        ).toList(),
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
