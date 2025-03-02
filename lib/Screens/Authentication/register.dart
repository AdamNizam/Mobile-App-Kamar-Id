import 'package:flutter/material.dart';

import '../../Constants/colors.dart';
import '../../Widgets/custombtn.dart';
import '../../Widgets/customtextfield.dart';
import '../../Widgets/detailstext2.dart';
import 'login.dart';
import 'otp_screen.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
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
                              width: 36,
                              height: 36,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Kamar.Id',
                              style: TextStyle(
                                fontSize: 32,
                                color: AppColors.redDark,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Create Your Account',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const CustomTextField(
                      icon: Icons.person,
                      label: 'First Name',
                    ),
                    const SizedBox(height: 7),
                    const CustomTextField(
                      icon: Icons.person,
                      label: 'Last Name',
                    ),
                    const SizedBox(height: 7),
                    const CustomTextField(
                      icon: Icons.email,
                      label: 'Email Address',
                    ),
                    const SizedBox(height: 7),
                    const CustomTextField(
                      icon: Icons.phone,
                      label: 'Phone Number',
                    ),
                    const SizedBox(height: 7),
                    const CustomTextField(
                      icon: Icons.lock,
                      icon2: Icons.visibility_off,
                      label: 'Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 7),
                    const CustomTextField(
                      icon: Icons.lock,
                      icon2: Icons.visibility_off,
                      label: 'Confirm Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 8),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        const Expanded(
                          child: Text(
                            'Saya telah membaca dan menerima Syarat dan Kebijakan Privasi',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    CustomButton(
                      text: 'Register Now',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const OtpScreen()),
                        );
                      },
                    ),
                    const Center(child: Text2(text2: 'Or')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const LogIn()),
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
      ),
    );
  }
}
