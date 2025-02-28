import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Screens/Authentication/whatsyourlocation.dart';

import '../../Constants/colors.dart';
import '../../Widgets/custombtn.dart';
import '../../Widgets/customtextfield.dart';
import '../../Widgets/detailstext1.dart';
import '../../Widgets/detailstext2.dart';
import 'getstarted.dart';
import 'login.dart';
import 'otp_screen.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text1(text1: 'Create Your Account'),
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                 const SizedBox(height: 5,),
                  const CustomTextField(
                      icon: Icons.person_outline, label: 'First Name'),
                  const CustomTextField(
                      icon: Icons.person_outline, label: 'Last Name'),

                  const CustomTextField(icon: Icons.email, label: 'Email Address'),

                  const CustomTextField(
                      icon: Icons.lock,
                      icon2: Icons.visibility_off,
                      label: 'Password'),
                  const CustomTextField(
                      icon: Icons.lock,
                      icon2: Icons.visibility_off,
                      label: 'Confirm Password'),
                  const SizedBox(
                    height: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => const LogIn()));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text2(text2: 'Already have an account?'),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Log in',
                          style: TextStyle(color:AppColors.buttonColor, fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const CustomBottomWithImage(
                    image: 'images/icons8-google-48.png',
                    text: 'Continue With Google',
                  ),const CustomBottomWithImage(
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
                    height: 5,
                  ),
                  CustomButton(
                      text: 'Sign up',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>  const WhatsYourLocationScreen()));
                      }),
                  const Center(child: Text2(text2: 'Or')),
                  CustomButton(text: 'With Mobile Number', onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => const OtpScreen()));
                  }),
                  const SizedBox(height: 5,),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
