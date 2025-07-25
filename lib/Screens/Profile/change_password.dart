import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/user/user_update/update_user_bloc.dart';
import 'package:hotelbookingapp/Data/Models/UserModel/form_update_password.dart';

import '../../CustomWidgets/CustomButton/custombtn.dart';
import '../../CustomWidgets/CustomText/custom_text_field.dart';
import '../../CustomWidgets/CustomText/text1.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();

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
                CustomTextField(
                  icon: Icons.lock,
                  icon2: Icons.visibility_off,
                  label: 'Current Password',
                  controller: currentPasswordController,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  icon: Icons.lock,
                  icon2: Icons.visibility_off,
                  label: 'New Password',
                  controller: newPasswordController,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomButton(
          text: "Change Password",
          onTap: () {
            final dataRequest = FormUpdatePassword(
              currentPassword: currentPasswordController.text,
              newPassword: newPasswordController.text,
            );
            context.read<UpdateUserBloc>().add(
                  PostUpdatePasswordEvent(dataRequest),
                );
          },
        ),
      ),
    );
  }
}
