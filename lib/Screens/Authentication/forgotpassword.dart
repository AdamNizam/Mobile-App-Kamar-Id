import 'package:flutter/material.dart';

import '../../Widgets/custombtn.dart';
import '../../Widgets/customtextfield.dart';
import '../../Widgets/detailstext1.dart';
import '../../Widgets/detailstext2.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),

                  const SizedBox(
                    height: 8,
                  ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           const Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text1(text1: 'Reset Your Password'),
                               Text('  🔑')
                             ],
                           ),
                           const SizedBox(
                             height: 12,
                           ),
                           const Center(
                             child: Text2(
                                 text2:
                                     'Please enter the email associated with your account'),
                           ),
                           const SizedBox(
                             height: 16,
                           ),
                           const CustomTextField(icon: Icons.email, label: 'Email Address'),
                           const SizedBox(
                             height: 7,
                           ),
                           const SizedBox(
                             height: 400,
                           ),
                           CustomButton(text: 'Send', onTap: () {}),
                         ],
                       ),
                ],
              ),
            ),
          )),
    );
  }
}
