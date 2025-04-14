import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Shared/custom_methods.dart';
import 'package:hotelbookingapp/Widgets/detailstext1.dart';
import 'package:hotelbookingapp/Widgets/detailstext2.dart';
import 'package:intl/intl.dart';

import '../../../Widgets/custombtn.dart';

class ConfirmBookingScreen extends StatefulWidget {
  final String imageUrl;
  final String hotelName;
  final String location;
  final DateTime chekIn;
  final DateTime chekOut;
  final String roomType;
  final String guest;
  final int pricePerNight;
  final String totalAmount;

  const ConfirmBookingScreen({
    super.key,
    required this.imageUrl,
    required this.hotelName,
    required this.location,
    required this.chekIn,
    required this.chekOut,
    required this.roomType,
    required this.guest,
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
                            widget.imageUrl,
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
                              widget.hotelName,
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
                              Text2(text2: widget.location),
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
                              text1:
                                  DateFormat('MMMM dd, yyyy | hh:mm a').format(
                                widget.chekIn,
                              ),
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
                              text1:
                                  DateFormat('MMMM dd, yyyy | hh:mm a').format(
                                widget.chekOut,
                              ),
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
                            Text1(text1: widget.guest),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text2(text2: 'Price per Night'),
                            Text1(text1: formatToRp(widget.pricePerNight)),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text2(text2: 'Servie Fee'),
                            Text1(text1: '20%'),
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
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: Text2(
                          text2: 'Edit Data',
                          color: AppColors.buttonColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text2(text2: 'Full Name'),
                            Text1(text1: 'Adam Nizam'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text2(text2: 'Fist Name'),
                            Text1(text1: 'Adam'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text2(text2: 'Last Name'),
                            Text1(text1: 'Nizam'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text2(text2: 'Email'),
                            Text1(text1: 'adam@example.com'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text2(text2: 'Phone Number'),
                            Text1(text1: '+62 812-3456-7890'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text2(text2: 'Address'),
                            Flexible(
                              child:
                                  Text1(text1: 'Jl. Merdeka No. 123, Jakarta'),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text2(text2: 'Postal Code'),
                            Text1(text1: '12345'),
                          ],
                        ),
                      ),
                    ],
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
        child: CustomButton(
          text: 'Pay Now',
          onTap: () {},
        ),
      ),
    );
  }
}
