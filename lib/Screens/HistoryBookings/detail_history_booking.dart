import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomBar/customapp_top_bar.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext1.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_ellipsis.dart';
import 'package:hotelbookingapp/Screens/GoogleMaps/google_maps_hotel.dart';
import 'package:hotelbookingapp/Shared/custom_snackbar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class BookingDetailPage extends StatelessWidget {
  const BookingDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppTopBar(
        title: 'Booking Detail',
        icon: Icons.more_vert,
        onPop: () {
          Navigator.pop(context);
        },
        onTap: () {
          showCustomSnackbar(context, 'fitur is not avaibale');
        },
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
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextEllipsis(
                      text: "Location",
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                      size: 14,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const GoogleMapsHotel(
                  initialPosition: LatLng(
                    -8.890461192156403,
                    116.27823302115988,
                  ),
                  title: 'Pandu Homes Stay',
                  snippet: 'Kuta, Mandlika',
                  heightMap: 200,
                ),
                const CustomTextEllipsis(
                  text: "Your Booking",
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                  size: 14,
                ),
                const SizedBox(height: 12),
                _rowBookingDetail(
                  Icons.confirmation_number,
                  'Code booking',
                  '545JSK0',
                ),
                const SizedBox(height: 10),
                _rowBookingDetail(
                  Icons.calendar_today,
                  'Check-in',
                  '10-10-2025',
                ),
                const SizedBox(height: 10),
                _rowBookingDetail(
                  Icons.calendar_today,
                  'Check-out',
                  '10-10-2025',
                ),
                const SizedBox(height: 10),
                _rowBookingDetail(
                  Icons.meeting_room_outlined,
                  'Room type',
                  'Type Room',
                ),
                const SizedBox(height: 10),
                _rowBookingDetail(
                  Icons.people_outline,
                  'Guest',
                  '1',
                ),
                const SizedBox(height: 10),
                _rowBookingDetail(
                  Icons.people,
                  'name',
                  'Andre lucmana',
                ),
                const SizedBox(height: 10),
                _rowBookingDetail(
                  Icons.email,
                  'Email',
                  'andreLuc10@gmail.com',
                ),
                const SizedBox(height: 10),
                _rowBookingDetail(
                  Icons.phone,
                  'Phone number',
                  '087862910011',
                ),
                const SizedBox(height: 10),
                _rowBookingDetail(
                  Icons.location_city,
                  'Addres',
                  '-',
                ),
                const SizedBox(height: 10),
                _rowBookingDetail(
                  Icons.folder_zip,
                  'Zip code',
                  '10011',
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _rowBookingDetail(
    IconData icon,
    String label,
    String value,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: AppColors.black,
        ),
        const SizedBox(width: 8),
        Text1(
          text1: label,
          color: AppColors.cadetGray,
          size: 14,
          fontWeight: FontWeight.w500,
        ),
        const Spacer(),
        Text1(
          text1: value,
          color: AppColors.black,
          size: 14,
          fontWeight: FontWeight.bold,
        )
      ],
    );
  }
}
