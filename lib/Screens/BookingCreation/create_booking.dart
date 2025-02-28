import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Screens/Booking/payment_method.dart';
import '../../Widgets/custombtn.dart';
import '../../Widgets/customtextfield.dart';
import '../../Widgets/customapp_bar.dart';

class CreateBooking extends StatelessWidget {
  const CreateBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(text: 'Create Booking', text1: ''),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: const [
                    // Booking Details
                    CustomTextField(label: 'Guest Name', icon: Icons.person),
                    SizedBox(height: 5),
                    CustomTextField(label: 'Hotel Name', icon: Icons.hotel),
                    SizedBox(height: 5),
                    CustomTextField(label: 'Check-in Date', icon: Icons.date_range),
                    SizedBox(height: 5),
                    CustomTextField(label: 'Check-out Date', icon: Icons.date_range),
                    SizedBox(height: 5),
                    CustomTextField(label: 'Room Type', icon: Icons.bed),
                    SizedBox(height: 5),
                    CustomTextField(label: 'Number of Guests', icon: Icons.group),
                    SizedBox(height: 5),
                    CustomTextField(label: 'Special Requests', icon: Icons.request_page),
                    SizedBox(height: 5),
                    CustomTextField(label: 'Booking Price', icon: Icons.attach_money),
                    SizedBox(height: 20),

                    // Optional Fields for Additional Details
                    CustomTextField(label: 'Payment Method (Optional)', icon: Icons.payment),
                    SizedBox(height: 5),
                    CustomTextField(label: 'Additional Notes (Optional)', icon: Icons.note),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              CustomButton(text: 'Create Booking', onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PaymentMethod()));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
