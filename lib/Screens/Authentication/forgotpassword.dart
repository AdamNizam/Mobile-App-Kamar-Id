import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/forget_password/forget_password_bloc.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../CustomWidgets/CustomButton/custombtn.dart';
import '../../CustomWidgets/CustomText/custom_text_field.dart';
import '../../CustomWidgets/CustomText/text1.dart';
import '../../CustomWidgets/CustomText/text2.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final emailForgetController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetPasswordFailed) {
              showCustomSnackbar(context, state.error);
            }
            if (state is ForgetPasswordSuccess) {
              showCustomSnackbar(context, 'send password success');
            }
          },
          builder: (context, state) {
            if (state is ForgetPasswordLoading) {
              return Center(
                child: LoadingAnimationWidget.hexagonDots(
                  color: AppColors.buttonColor,
                  size: 50,
                ),
              );
            }
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text1(
                              text1: 'Reset Your Password',
                              size: 16,
                            ),
                            Text('  🔑')
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Center(
                          child: Text2(
                            text2: 'Please enter the email with your account',
                          ),
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          icon: Icons.email,
                          label: 'Email Address',
                          controller: emailForgetController,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: CustomButton(
          text: 'Send',
          onTap: () {
            if (emailForgetController.text.isNotEmpty &&
                emailForgetController.text.contains('@gmail.com')) {
              context.read<ForgetPasswordBloc>().add(PostEmailForgetPassword(
                    emailForgetController.text,
                  ));
            } else {
              showCustomSnackbar(context, 'Email tidak valid');
            }
          },
        ),
      ),
    );
  }
}
