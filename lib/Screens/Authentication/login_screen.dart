// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/auth/auth_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext1.dart';
import 'package:hotelbookingapp/Models/AuthModel/form_login_model.dart';
import 'package:hotelbookingapp/Screens/Authentication/getstarted.dart';
import 'package:hotelbookingapp/Screens/Authentication/register.dart';
import 'package:hotelbookingapp/Services/facebook_sign_in_service.dart';
import 'package:hotelbookingapp/Services/google_sign_in_service.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../CustomWidgets/CustomButton/custombtn.dart';
import '../../CustomWidgets/CustomText/customtextfield.dart';
import '../../CustomWidgets/CustomText/detailstext2.dart';
import '../../Themes/colors.dart';
import 'forgotpassword.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LogInState();
}

class _LogInState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool validate() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  void handleGoogleLogin() async {
    final googleService = GoogleSignInService();
    final userData = await googleService.signInWithGoogle();

    if (userData != null) {
      showCustomSnackbar(context, 'Login Google Berhasil: ${userData['name']}');
    } else {
      showCustomSnackbar(context, 'Login Google dibatalkan atau gagal');
    }
  }

  void handleFacebookLogin() async {
    FacebookAuthService facebookAuthService = FacebookAuthService();
    final userData = await facebookAuthService.login();

    if (userData != null) {
      showCustomSnackbar(context, 'Login berhasil: ${userData['name']}');
    } else {
      showCustomSnackbar(context, 'Gagal login dengan Facebook');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.error);
          }
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: LoadingAnimationWidget.hexagonDots(
                color: AppColors.buttonColor,
                size: 50,
              ),
            );
          }

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          const SizedBox(width: 10),
                          const Text1(
                            text1: 'Kamar.Id',
                            size: 27,
                            color: AppColors.buttonColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Center(
                        child: Text1(
                          text1: 'Please Enter your account',
                          size: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        icon: Icons.email,
                        label: 'Email Address',
                        controller: emailController,
                      ),
                      const SizedBox(height: 7),
                      CustomTextField(
                        icon: Icons.lock,
                        icon2: Icons.visibility_off,
                        obscureText: true,
                        label: 'Password',
                        controller: passwordController,
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ForgotPassword()),
                          );
                        },
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: AppColors.buttonColor,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                      CustomButton(
                        text: 'Log In',
                        onTap: () {
                          if (validate()) {
                            context.read<AuthBloc>().add(
                                  AuthLogin(
                                    FormLoginModel(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  ),
                                );
                          } else {
                            showCustomSnackbar(
                                context, 'Enter your username & password');
                          }
                        },
                      ),
                      const Center(child: Text2(text2: 'Or')),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomBottomWithImage(
                            image: 'images/icons8-google-48.png',
                            text: 'Continue With Google',
                            onTap: handleGoogleLogin,
                          ),
                          const SizedBox(width: 10),
                          CustomBottomWithImage(
                            image: 'images/icons8-facebook-48.png',
                            text: 'Continue With Facebook',
                            onTap: handleFacebookLogin,
                          ),
                        ],
                      ),
                      const SizedBox(height: 200),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text1(
                              text1: "Do you want create new account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const Register()),
                              );
                            },
                            child: const Text(
                              'Register',
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
