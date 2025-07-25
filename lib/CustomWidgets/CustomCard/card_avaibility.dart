import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomIcon/custom_icon1_avaibility.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomIcon/custom_icon2_avaibility.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_ellipsis.dart';
import 'package:hotelbookingapp/Data/Models/HotelModel/hotel_detail_model.dart';
import 'package:hotelbookingapp/Data/Models/HotelModel/result_check_avaibility.dart';
import 'package:hotelbookingapp/Screens/DetailRoom/detail_room_screen.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class CardAvailbility extends StatefulWidget {
  final RoomChekAvaibility dataRoom;
  final RowData dataHotel;
  final DateTime checkInDate;
  final DateTime checkOutDate;

  final int adult;
  final int child;

  const CardAvailbility({
    super.key,
    required this.dataRoom,
    required this.dataHotel,
    required this.checkInDate,
    required this.checkOutDate,
    required this.adult,
    required this.child,
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
            builder: (context) => DetailRoomScreen(
              dataRoom: widget.dataRoom,
              dataHotel: widget.dataHotel,
              checkIn: widget.checkInDate,
              checkOut: widget.checkOutDate,
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
          side: const BorderSide(
            color: AppColors.beauBlue,
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
                child: (widget.dataRoom.image != false &&
                        widget.dataRoom.image.isNotEmpty)
                    ? Image.network(
                        widget.dataRoom.image,
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
                          CustomTextEllipsis(
                            text: widget.dataRoom.title ?? "No information",
                            size: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Text1(
                        text1: widget.dataRoom.priceText,
                        size: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.buttonColor,
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
                        children: widget.dataRoom.termFeatures!.map(
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
