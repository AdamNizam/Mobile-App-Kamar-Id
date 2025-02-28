import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Screens/Booking/payment_method.dart';
import 'package:intl/intl.dart';

import '../../../Constants/colors.dart';
import '../../Widgets/customapp_bar.dart';
import '../../Widgets/custombtn.dart';
import '../../Widgets/customtextfield.dart';

class BookHotelScreen extends StatefulWidget {
  const BookHotelScreen({super.key});

  @override
  BookHotelScreenState createState() => BookHotelScreenState();
}

class BookHotelScreenState extends State<BookHotelScreen> {
  String? selectedRoomType;
  DateTime? selectedCheckInDate;
  DateTime? selectedCheckOutDate;

  final List<String> roomTypes = ['Single Room', 'Double Room', 'Suite', 'Deluxe'];
  final List<DateTime> availableDates = List.generate(10, (index) => DateTime.now().add(Duration(days: index)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(text: 'Book Hotel', text1: ''),
                const SizedBox(height: 20),

                const Text(
                  'Choose Room Type:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildRoomTypeSelection(),
                const SizedBox(height: 20),

                const Text(
                  'Select Check-in Date:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildCheckInDateSelection(),
                const SizedBox(height: 20),

                const Text(
                  'Select Check-out Date:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildCheckOutDateSelection(),
                const SizedBox(height: 20),

                const CustomTextField(
                  label: 'Enter Full Name',
                  icon: Icons.person,
                ),
                const SizedBox(height: 10),

                const CustomTextField(
                  label: 'Enter Email Address',
                  icon: Icons.email,
                ),
                const SizedBox(height: 10),

                const CustomTextField(
                  label: 'Enter Mobile Number',
                  icon: Icons.phone_android,
                ),
                const SizedBox(height: 10),

                const CustomTextField(
                  label: 'Enter Address',
                  icon: Icons.location_on,
                ),
                const SizedBox(height: 10),

                const CustomTextField(
                  label: 'Enter City',
                  icon: Icons.location_city,
                ),
                const SizedBox(height: 10),

                const CustomTextField(
                  label: 'Enter Postal Code',
                  icon: Icons.local_post_office,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
        child: CustomButton(text: 'Confirm Booking', onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const PaymentMethod()));
        }),
      ),
    );
  }

  Widget _buildRoomTypeSelection() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: roomTypes.map((roomType) {
        bool isSelected = selectedRoomType == roomType;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedRoomType = roomType;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 7),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.tabColor : Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: isSelected ? AppColors.tabColor : Colors.grey),
            ),
            child: Text(
              roomType,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCheckInDateSelection() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: availableDates.map((date) {
        bool isSelected = selectedCheckInDate != null && DateFormat('yMMMd').format(selectedCheckInDate!) == DateFormat('yMMMd').format(date);
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedCheckInDate = date;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 7),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.tabColor : Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: isSelected ? AppColors.tabColor : Colors.grey),
            ),
            child: Text(
              DateFormat('MMMd').format(date),
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCheckOutDateSelection() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: availableDates.map((date) {
        bool isSelected = selectedCheckOutDate != null && DateFormat('yMMMd').format(selectedCheckOutDate!) == DateFormat('yMMMd').format(date);
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedCheckOutDate = date;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 7),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.tabColor : Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: isSelected ? AppColors.tabColor : Colors.grey),
            ),
            child: Text(
              DateFormat('MMMd').format(date),
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
