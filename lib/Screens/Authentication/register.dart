import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/auth/auth_bloc.dart';
import 'package:hotelbookingapp/Models/AuthModel/form_register_model.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:hotelbookingapp/Widgets/detailstext1.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../Constants/colors.dart';
import '../../Widgets/custombtn.dart';
import '../../Widgets/customtextfield.dart';
import 'login.dart';

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
            Navigator.pushNamedAndRemoveUntil(
                context, '/message-success-register', (route) => false,
                arguments: state.data);
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
                            const Text(
                              'Create new Account',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          icon: Icons.person,
                          label: 'First Name',
                          controller: firstNameController,
                        ),
                        const SizedBox(height: 7),
                        CustomTextField(
                          icon: Icons.person,
                          label: 'Last Name',
                          controller: lastNameController,
                        ),
                        const SizedBox(height: 7),
                        CustomTextField(
                          icon: Icons.email,
                          label: 'Email Address',
                          controller: emailController,
                        ),
                        const SizedBox(height: 7),
                        CustomTextField(
                          icon: Icons.phone,
                          label: 'Phone Number',
                          controller: phoneController,
                        ),
                        const SizedBox(height: 7),
                        CustomTextField(
                          icon: Icons.lock,
                          icon2: Icons.visibility_off,
                          label: 'Password',
                          obscureText: true,
                          controller: passwordController,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: AppColors.redDark,
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value ?? false;
                                });
                              },
                            ),
                            const Expanded(
                              child: Text(
                                'Saya telah membaca dan menerima Syarat dan Kebijakan Privasi',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: 'Register now',
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
                                    context, 'You Dont Cheklist');
                              }
                            } else {
                              showCustomSnackbar(
                                  context, 'All field must be entered');
                            }
                          },
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text1(text1: "Already have an account? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const Login()),
                                );
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: AppColors.buttonColor,
                                  fontWeight: FontWeight.bold,
                                ),
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
