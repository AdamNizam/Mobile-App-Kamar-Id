import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/user/data_user/user_bloc.dart';
import 'package:hotelbookingapp/Blocs/user/user_update/update_user_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomBar/customapp_top_bar.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text2.dart';
import 'package:hotelbookingapp/Models/UserModel/request_user_update.dart';
import 'package:hotelbookingapp/Shared/shared_data.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../CustomWidgets/CustomButton/custombtn.dart';
import '../../CustomWidgets/CustomText/custom_text_field.dart';
import '../../Themes/colors.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  String? fullname;
  String? email;
  String? imageProfile;
  String? avatarId;
  String? selectedCountry;
  DateTime? selectedDate = DateTime.now();
  bool isLoading = false;
  final ImagePicker imagePicker = ImagePicker();

  final fullNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final streetAddressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getLostData();
    _getDataUser();
  }

  Future<void> _getImage(ImageSource source) async {
    final XFile? pickedFile = await imagePicker.pickImage(source: source);
    if (!mounted) return;

    if (pickedFile == null) {
      showCustomSnackbar(context, 'Image invalid');
      return;
    }

    debugPrint('Location Path Image: ${pickedFile.path}');
    context.read<UpdateUserBloc>().add(UploadProfileEvent(
          File(pickedFile.path),
        ));
  }

  Future<void> _getLostData() async {
    final LostDataResponse response = await imagePicker.retrieveLostData();
    if (!response.isEmpty && response.file != null) {
      setState(() {});
    }
  }

  Future<void> _getDataUser() async {
    final userState = context.read<UserBloc>().state;
    if (userState is UserSuccess) {
      fullname = userState.data.name;
      email = userState.data.email;
      imageProfile = userState.data.avatarThumbUrl;

      fullNameController.text = userState.data.name ?? '';
      firstNameController.text = userState.data.firstName ?? '';
      lastNameController.text = userState.data.lastName ?? '';
      emailController.text = userState.data.email ?? '';
      phoneController.text = userState.data.phone ?? '';
      streetAddressController.text = userState.data.address ?? '';
      cityController.text = userState.data.city ?? '';
      stateController.text = userState.data.state ?? '';
      zipCodeController.text = userState.data.zipCode?.toString() ?? '';
      selectedCountry = userState.data.country;
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.buttonColor,
              onPrimary: AppColors.white,
              onSurface: AppColors.black,
            ),
            dialogBackgroundColor: AppColors.white, // Background putih
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateUserBloc, UpdateUserState>(
      listener: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (state is UpdateUserSuccess) {
            showCustomSnackbar(context, 'Update data Success');
          }
          if (state is UpdateUserFailed) {
            showCustomSnackbar(context, state.error);
          }
          if (state is UploadImageLoading) {
            setState(() {
              isLoading = true;
            });
          }
          if (state is UpdateProfileSuccess) {
            showCustomSnackbar(context, 'Upload image Success');
            setState(() {
              isLoading = false;
              avatarId = state.data.data!.id.toString();
              imageProfile = state.data.url;
            });
          }
        });
      },
      builder: (context, state) {
        if (state is UpdateUserLoading) {
          return Scaffold(
            body: Center(
              child: LoadingAnimationWidget.hexagonDots(
                color: AppColors.buttonColor,
                size: 50,
              ),
            ),
          );
        }
        return Scaffold(
          appBar: CustomAppTopBar(
            title: 'Data Information',
            onPop: () {
              Navigator.pop(context);
            },
            onTap: () {},
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  children: [_imageProfile(), _dataProfileUser()],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
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
                  birthday: selectedDate.toString(),
                  bio: '',
                  avatarId: avatarId ?? '',
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
                    .add(PostDataUpdateEvent(dataRequest));
              },
            ),
          ),
        );
      },
    );
  }

  Widget _imageProfile() {
    return Column(
      children: [
        Center(
          child: isLoading
              ? LoadingAnimationWidget.discreteCircle(
                  color: AppColors.buttonColor,
                  size: 40,
                )
              : Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.white,
                          width: 3,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: (imageProfile == null)
                            ? const AssetImage(
                                'images/user_default_profile.png',
                              )
                            : NetworkImage(
                                imageProfile!,
                              ) as ImageProvider<Object>?,
                      ),
                    ),
                    Positioned(
                      bottom: -0,
                      right: -0,
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: AppColors.white,
                            elevation: 0,
                            builder: (BuildContext context) {
                              return SafeArea(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        leading: const Icon(
                                          Icons.camera_alt,
                                          color: AppColors.buttonColor,
                                        ),
                                        title: const Text('Camera'),
                                        onTap: () {
                                          Navigator.of(context).pop();
                                          _getImage(ImageSource.camera);
                                        },
                                      ),
                                      ListTile(
                                        leading: const Icon(
                                          Icons.photo_library,
                                          color: AppColors.buttonColor,
                                        ),
                                        title: const Text('Gallery'),
                                        onTap: () {
                                          Navigator.of(context).pop();
                                          _getImage(ImageSource.gallery);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: AppColors.white, width: 2),
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
      ],
    );
  }

  Widget _dataProfileUser() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Center(
          child: Text2(
            text2: fullname ?? '',
            size: 16,
            color: AppColors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Center(
          child: Text2(
            text2: email ?? '',
            size: 15,
            color: AppColors.cadetGray,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        CustomTextField(
          icon: Icons.person,
          label: 'Name',
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.beauBlue),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 20,
                          color: AppColors.black,
                        ),
                        const SizedBox(width: 8),
                        Text1(
                          text1: selectedDate != null
                              ? DateFormat('dd/MM/yyyy').format(selectedDate!)
                              : 'Select Date',
                        ),
                      ],
                    )),
              ),
              const SizedBox(height: 15),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.beauBlue),
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
            ],
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
