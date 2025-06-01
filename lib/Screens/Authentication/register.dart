import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hotelbookingapp/Blocs/auth/auth_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext1.dart';
import 'package:hotelbookingapp/Models/AuthModel/form_register_model.dart';
import 'package:hotelbookingapp/Screens/Authentication/message_success.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../CustomWidgets/CustomButton/custombtn.dart';
import '../../CustomWidgets/CustomText/customtextfield.dart';
import '../../Themes/colors.dart';
import 'login_screen.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final firstNameController = TextEditingController(text: '');
  final lastNameController = TextEditingController(text: '');
  final phoneController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  bool isChecked = false;

  bool validate() {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.error);
          }
          if (state is AuthRegSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const MessageSuccess(
                  title: 'Register Success!',
                  message: 'Please, Verified your email',
                  urlRoute: '/login',
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: LoadingAnimationWidget.hexagonDots(
                color: AppColors.tabColor,
                size: 50,
              ),
            );
          }
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'images/Logo_Kamarid.png',
                                  width: 50,
                                  height: 50,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Kamar.Id',
                                  style: TextStyle(
                                    fontSize: 27,
                                    color: AppColors.buttonColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text1(
                              text1: AppLocalizations.of(context)!.descTopReg,
                              size: 16,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          icon: Icons.person,
                          label:
                              AppLocalizations.of(context)!.labelTextFirstName,
                          controller: firstNameController,
                        ),
                        const SizedBox(height: 7),
                        CustomTextField(
                          icon: Icons.person,
                          label:
                              AppLocalizations.of(context)!.labelTextLastNamr,
                          controller: lastNameController,
                        ),
                        const SizedBox(height: 7),
                        CustomTextField(
                          icon: Icons.email,
                          label: AppLocalizations.of(context)!.labelTextEmail,
                          controller: emailController,
                        ),
                        const SizedBox(height: 7),
                        CustomTextField(
                          icon: Icons.phone,
                          label: AppLocalizations.of(context)!
                              .labelTextPhoneNumber,
                          controller: phoneController,
                        ),
                        const SizedBox(height: 7),
                        CustomTextField(
                          icon: Icons.lock,
                          icon2: Icons.visibility_off,
                          label:
                              AppLocalizations.of(context)!.labelTextPassword,
                          obscureText: true,
                          controller: passwordController,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: AppColors.redAwesome,
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: Text1(
                                text1: AppLocalizations.of(context)!
                                    .labeTextPrivacy,
                                size: 14,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: AppLocalizations.of(context)!.textBtnRegister,
                          onTap: () {
                            if (validate()) {
                              if (isChecked) {
                                context.read<AuthBloc>().add(
                                      AuthRegister(
                                        FormRegisterModel(
                                          firstName: firstNameController.text,
                                          lastName: lastNameController.text,
                                          phone: phoneController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                        ),
                                      ),
                                    );
                              } else {
                                showCustomSnackbar(
                                  context,
                                  AppLocalizations.of(context)!.messagePrivacy,
                                );
                              }
                            } else {
                              showCustomSnackbar(
                                context,
                                AppLocalizations.of(context)!.messagePrivacy,
                              );
                            }
                          },
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text1(
                              text1:
                                  AppLocalizations.of(context)!.descBottomReg,
                              color: AppColors.cadetGray,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const Login()),
                                );
                              },
                              child: Text1(
                                text1: AppLocalizations.of(context)!.textLogin,
                                color: AppColors.buttonColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
