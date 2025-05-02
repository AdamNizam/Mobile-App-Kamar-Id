import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Screens/Authentication/register.dart';

import '../../CustomWidgets/CustomButton/custom_outline_button.dart';
import '../../CustomWidgets/CustomButton/custombtn.dart';
import '../../CustomWidgets/detailstext1.dart';
import '../../CustomWidgets/detailstext2.dart';
import 'login.dart';
import 'otp_screen.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text1(text1: 'Lets Get Started!'),
                const SizedBox(
                  height: 8,
                ),
                const Text2(text2: 'Lets dive into your account'),
                const SizedBox(
                  height: 8,
                ),
                const CustomBottomWithImage(
                  image: 'images/icons8-google-48.png',
                  text: 'Continue With Google',
                ),
                const CustomBottomWithImage(
                  image: 'images/icons8-apple-48.png',
                  text: 'Continue With Apple',
                ),
                const CustomBottomWithImage(
                  image: 'images/icons8-facebook-48.png',
                  text: 'Continue With Facebook',
                ),
                const CustomBottomWithImage(
                  image: 'images/icons8-twitter-48.png',
                  text: 'Continue With Twitter',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                    text: 'Sign up',
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const Register()));
                    }),
                CustomOutlinedButton(
                    text: 'Login',
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const Login()));
                    }),
                const Text2(text2: 'Or'),
                CustomButton(
                    text: 'With Mobile Number',
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const OtpScreen()));
                    }),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text2(text2: 'Privacy Policy'),
                    SizedBox(
                      width: 15,
                    ),
                    Text2(text2: 'Terms Of Service'),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class CustomBottomWithImage extends StatelessWidget {
  final String image, text;
  const CustomBottomWithImage({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      width: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            width: 30,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 5, left: 80),
          //   child: Text2(text2: text),
          // )
        ],
      ),
    );
  }
}
