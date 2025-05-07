import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomBar/customapp_top_bar.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_ellipsis.dart';
import 'package:hotelbookingapp/Screens/GoogleMaps/google_maps_hotel.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class BookingDetailPage extends StatelessWidget {
  const BookingDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppTopBar(
        title: 'Booking Detail',
        icon: Icons.more_vert,
        iconColor: AppColors.buttonColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: const BorderSide(
              color: AppColors.beauBlue,
              width: 1,
            ),
          ),
          elevation: 0,
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://picsum.photos/400/300',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTextEllipsis(
                          text: "The Aston Vill Hotel",
                          size: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                        const SizedBox(
                          width: 3,
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 20,
                              color: AppColors.buttonColor,
                            ),
                            SizedBox(width: 3),
                            CustomTextEllipsis(
                              text: 'hotel location',
                              fontWeight: FontWeight.w500,
                              color: AppColors.cadetGray,
                              size: 13,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Rp1.200.000',
                                style: TextStyle(
                                  color: AppColors.buttonColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' /night',
                                style: TextStyle(
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomTextEllipsis(
                      text: "Location",
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                      size: 14,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const CustomTextEllipsis(
                        text: "Open Map",
                        fontWeight: FontWeight.w500,
                        color: AppColors.buttonColor,
                        size: 13,
                      ),
                    ),
                  ],
                ),
                const GoogleMapsHotel(
                  initialPosition:
                      LatLng(-8.890461192156403, 116.27823302115988),
                  title: 'Pandu Homes Stay',
                  snippet: 'Kuta',
                  heightMap: 200,
                ),
                const CustomTextEllipsis(
                  text: "Your Booking",
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                  size: 14,
                ),
                const SizedBox(height: 12),
                const Row(
                  children: [
                    Icon(Icons.calendar_today, size: 18),
                    SizedBox(width: 8),
                    Text("Dates"),
                    Spacer(),
                    Text("12 - 14 Nov 2024",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Icon(Icons.people_outline, size: 18),
                    SizedBox(width: 8),
                    Text("Guest"),
                    Spacer(),
                    Text("2 Guests (1 Room)",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Icon(Icons.meeting_room_outlined, size: 18),
                    SizedBox(width: 8),
                    Text("Room type"),
                    Spacer(),
                    Text("Queen Room",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Icon(Icons.phone, size: 18),
                    SizedBox(width: 8),
                    Text("Phone"),
                    Spacer(),
                    Text("02143454646",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
