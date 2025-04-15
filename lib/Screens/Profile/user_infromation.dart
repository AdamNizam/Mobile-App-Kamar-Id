import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/user/user_bloc.dart';

import '../../Constants/colors.dart';
import '../../Widgets/custombtn.dart';
import '../../Widgets/customtextfield.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final userNameController = TextEditingController(text: '');

  final firstNameController = TextEditingController(text: '');

  final lastNameController = TextEditingController(text: '');

  final emailController = TextEditingController(text: '');

  final phoneController = TextEditingController(text: '');

  final streetAddressController = TextEditingController(text: '');

  final cityController = TextEditingController(text: '');

  final stateController = TextEditingController(text: '');

  final zipCodeController = TextEditingController(text: '');

  final countryController = TextEditingController(text: '');

  late final String username;

  late final String email;

  @override
  void initState() {
    super.initState();
    final userState = context.read<UserBloc>().state;
    if (userState is UserSuccess) {
      username = userState.data.userName.toString();
      email = userState.data.email.toString();

      userNameController.text = userState.data.userName.toString();
      firstNameController.text = userState.data.firstName.toString();
      lastNameController.text = userState.data.lastName.toString();
      emailController.text = userState.data.email.toString();
      phoneController.text = userState.data.phone.toString();
      streetAddressController.text = userState.data.address.toString();
      cityController.text = userState.data.city.toString();
      stateController.text = userState.data.state.toString();
      zipCodeController.text = userState.data.zipCode.toString();
    }
  }

  final Map<String, String> countryList = {
    "AF": "Afghanistan",
    "AX": "Aland Islands",
    "AL": "Albania",
    "DZ": "Algeria",
    "AS": "American Samoa",
    "AD": "Andorra",
    "AO": "Angola",
    "AI": "Anguilla",
    "AQ": "Antarctica",
    "AG": "Antigua And Barbuda",
    "AR": "Argentina",
    "AM": "Armenia",
    "AW": "Aruba",
    "AU": "Australia",
    "AT": "Austria",
    "AZ": "Azerbaijan",
    "BS": "Bahamas",
    "BH": "Bahrain",
    "BD": "Bangladesh",
    "BB": "Barbados",
    "BY": "Belarus",
    "BE": "Belgium",
  };

  String? selectedCountry;

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
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          "https://randomuser.me/api/portraits/men/1.jpg",
                        ), // Example profile picture
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        username, // Example username
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.text1Color,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        email, // Example email
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.text2Color,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                      icon: Icons.person_2_sharp,
                      label: 'User Name',
                      controller: userNameController,
                    ),
                    CustomTextField(
                      icon: Icons.person_outline,
                      label: 'First Name',
                      controller: firstNameController,
                    ),
                    CustomTextField(
                      icon: Icons.person_outline,
                      label: 'Last Name',
                      controller: lastNameController,
                    ),
                    CustomTextField(
                      icon: Icons.email,
                      label: 'Email Address',
                      controller: emailController,
                    ),
                    CustomTextField(
                      icon: Icons.phone,
                      label: 'Phone Number',
                      controller: phoneController,
                    ),
                    CustomTextField(
                      icon: Icons.home,
                      label: 'Street Address',
                      controller: streetAddressController,
                    ),
                    CustomTextField(
                      icon: Icons.location_city,
                      label: 'City',
                      controller: cityController,
                    ),
                    CustomTextField(
                      icon: Icons.location_on,
                      label: 'State',
                      controller: stateController,
                    ),
                    CustomTextField(
                      icon: Icons.markunread_mailbox,
                      label: 'Zip Code',
                      controller: zipCodeController,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 0.0),
                      child: Container(
                        height: 50, // Meningkatkan tinggi agar lebih seimbang
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.textFormFieldBorderColor),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.public,
                                color: Colors.black54), // Ikon negara
                            const SizedBox(
                                width: 10), // Jarak antara ikon dan dropdown
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                isDense:
                                    true, // Bantu agar dropdown lebih ringkas
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                ),
                                value: selectedCountry,
                                hint: const Align(
                                  alignment: Alignment
                                      .centerLeft, // Agar hint sejajar kiri
                                  child: Text(
                                    "Pilih Negara",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                items: countryList.entries.map((entry) {
                                  return DropdownMenuItem<String>(
                                    value: entry.key,
                                    child: Text(
                                      entry.value,
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.black54),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedCountry = value;
                                  });
                                },
                                dropdownColor: Colors.white,
                                icon: const Icon(Icons.arrow_drop_down,
                                    color: Colors.black54),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: CustomButton(
            text: 'Save changes',
            onTap: () {
              // Handle save information action
            }),
      ),
    );
  }
}
