import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/user/user_profile/user_bloc.dart';
import 'package:hotelbookingapp/Blocs/user/user_update/update_user_bloc.dart';
import 'package:hotelbookingapp/Models/UserModel/request_user_update.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';

import '../../CustomWidgets/CustomButton/custombtn.dart';
import '../../CustomWidgets/CustomText/customtextfield.dart';
import '../../Themes/colors.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final fullNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final streetAddressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();

  String? fullname;
  String? email;
  String? imageProfile = '';
  String? selectedCountry;

  @override
  void initState() {
    super.initState();
    final userState = context.read<UserBloc>().state;
    if (userState is UserSuccess) {
      fullname = userState.data.name;
      email = userState.data.email;
      imageProfile = userState.data.avatarThumbUrl;

      fullNameController.text = userState.data.name;
      firstNameController.text = userState.data.firstName;
      lastNameController.text = userState.data.lastName;
      emailController.text = userState.data.email;
      phoneController.text = userState.data.phone;
      streetAddressController.text = userState.data.address ?? '';
      cityController.text = userState.data.city ?? '';
      stateController.text = userState.data.state ?? '';
      zipCodeController.text = userState.data.zipCode?.toString() ?? '';
      selectedCountry = userState.data.country;
    }
  }

  final Map<String, String> countryList = {
    "ID": "Indonesia",
    "Eng": "English",
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateUserBloc, UpdateUserState>(
      builder: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (state is UpdateUserSuccess) {
            showCustomSnackbar(context, state.data.message.userName[0]);
          }
          if (state is UpdateUserFailed) {
            showCustomSnackbar(context, 'update failed');
          }
        });
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage:
                                (imageProfile == null || imageProfile!.isEmpty)
                                    ? const AssetImage(
                                        'images/user_default_profile.png',
                                      )
                                    : NetworkImage(
                                        imageProfile!,
                                      ) as ImageProvider<Object>?,
                          ),
                          Positioned(
                            bottom: -0,
                            right: -0,
                            child: GestureDetector(
                              onTap: () {
                                // Aksi upload image, misalnya showModalBottomSheet atau pick image
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                ),
                                child: const Icon(
                                  Icons.camera_alt,
                                  size: 18,
                                  color: AppColors.cadetGray,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        fullname ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.text1Color,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        email ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.text2Color,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      icon: Icons.person,
                      label: 'User Name',
                      controller: fullNameController,
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
                    const SizedBox(height: 10),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.textFormFieldBorderColor),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.public, color: Colors.black54),
                          const SizedBox(width: 10),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              isDense: true,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                              ),
                              value: selectedCountry,
                              hint: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Select Country",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
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
                              dropdownColor: AppColors.white,
                              icon: const Icon(Icons.arrow_drop_down,
                                  color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            child: CustomButton(
              text: 'Save changes',
              onTap: () {
                final dataRequest = RequestUserUpdate(
                  businessName: '',
                  userName: fullNameController.text,
                  email: emailController.text,
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                  phone: phoneController.text,
                  birthday: '01/01/1970',
                  bio: '',
                  avatarId: '',
                  address: streetAddressController.text,
                  address2: '',
                  city: cityController.text,
                  state: stateController.text,
                  country: selectedCountry!,
                  zipCode: zipCodeController.text,
                );

                // print('Data Update User ${jsonEncode(dataRequest.toJson())}');
                context
                    .read<UpdateUserBloc>()
                    .add(PostUserUpdateEvent(dataRequest));
              },
            ),
          ),
        );
      },
    );
  }
}
