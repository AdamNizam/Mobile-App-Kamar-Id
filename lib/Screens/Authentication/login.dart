import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Screens/Authentication/register.dart';

import '../../Constants/colors.dart';
import '../../Widgets/custombtn.dart';
import '../../Widgets/customtextfield.dart';
import '../../Widgets/detailstext2.dart';
import 'forgotpassword.dart';
import 'getstarted.dart';
import 'otp_screen.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
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
                              fontSize: 32,
                              color: AppColors.redDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Please Enter your account',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    icon: Icons.email,
                    label: 'Email Address',
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  CustomTextField(
                    icon: Icons.lock,
                    icon2: Icons.visibility_off,
                    label: 'Password',
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ForgotPassword(),
                        ),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: AppColors.buttonColor, fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const CustomBottomWithImage(
                    image: 'images/icons8-google-48.png',
                    text: 'Continue With Google',
                  ),
                  const CustomBottomWithImage(
                    image: 'images/icons8-facebook-48.png',
                    text: 'Continue With Facebook',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                      text: 'Log In',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const OtpScreen()),
                        );
                      }),
                  const Center(child: Text2(text2: 'Or')),
                  CustomButton(
                      text: 'Register',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const Register()),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
