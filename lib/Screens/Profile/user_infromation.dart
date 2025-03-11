import 'package:flutter/material.dart';

import '../../Constants/colors.dart';
import '../../Widgets/custombtn.dart';
import '../../Widgets/customtextfield.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final firstNameController = TextEditingController(text: '');
  final lastNameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final phoneController = TextEditingController(text: '');
  final streetAddressController = TextEditingController(text: '');
  final cityController = TextEditingController(text: '');
  final stateController = TextEditingController(text: '');
  final zipCodeController = TextEditingController(text: '');
  final countryController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                            'images/c3.png'), // Example profile picture
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Center(
                      child: Text(
                        'John Doe', // Example username
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.text1Color,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Center(
                      child: Text(
                        'john.doe@example.com', // Example email
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.text2Color,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const CustomTextField(
                        icon: Icons.person_outline, label: 'First Name'),
                    const CustomTextField(
                        icon: Icons.person_outline, label: 'Last Name'),
                    const CustomTextField(
                        icon: Icons.email, label: 'Email Address'),
                    const CustomTextField(
                        icon: Icons.phone, label: 'Phone Number'),
                    const CustomTextField(
                        icon: Icons.home, label: 'Street Address'),
                    const CustomTextField(
                        icon: Icons.location_city, label: 'City'),
                    const CustomTextField(
                        icon: Icons.location_on, label: 'State'),
                    const CustomTextField(
                        icon: Icons.markunread_mailbox, label: 'Zip Code'),
                    const CustomTextField(icon: Icons.flag, label: 'Country'),
                    const SizedBox(height: 15),
                    CustomButton(
                        text: 'Save Information',
                        onTap: () {
                          // Handle save information action
                        }),
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
