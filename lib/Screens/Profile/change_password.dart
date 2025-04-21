import 'package:flutter/material.dart';

import '../../Widgets/custombtn.dart';
import '../../Widgets/customtextfield.dart';
import '../../Widgets/detailstext1.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text1(
                    text1: 'Change Your Password',
                    size: 16,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const CustomTextField(
                    icon: Icons.lock,
                    icon2: Icons.visibility_off,
                    label: 'Current Password'),
                const SizedBox(
                  height: 8,
                ),
                const CustomTextField(
                    icon: Icons.lock,
                    icon2: Icons.visibility_off,
                    label: 'New Password'),
                const SizedBox(
                  height: 8,
                ),
                const CustomTextField(
                    icon: Icons.lock,
                    icon2: Icons.visibility_off,
                    label: 'Confirm New Password'),
                const SizedBox(
                  height: 16,
                ),
                CustomButton(
                  text: 'Change Password',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
