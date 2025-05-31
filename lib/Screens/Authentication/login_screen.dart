// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hotelbookingapp/Blocs/auth/auth_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext1.dart';
import 'package:hotelbookingapp/Models/AuthModel/form_login_model.dart';
import 'package:hotelbookingapp/Providers/facebook_provider.dart';
import 'package:hotelbookingapp/Providers/google_provider.dart';
import 'package:hotelbookingapp/Screens/Authentication/getstarted.dart';
import 'package:hotelbookingapp/Screens/Authentication/register.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
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

  void handleLogin() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      context.read<AuthBloc>().add(
            AuthLoginEvent(
              FormLoginModel(
                email: emailController.text,
                password: passwordController.text,
              ),
            ),
          );
    } else {
      showCustomSnackbar(context, 'Enter your username & password');
    }
  }

  void handleGoogleLogin() async {
    final googleService = GoogleService();
    final userData = await googleService.signInWithGoogle();

    if (userData != null) {
      // final idToken = userData['idToken'];
      // final accessToken = userData['accessToken'];
      context.read<AuthBloc>().add(AuthGoogleEvent(userData['accessToken']));
    } else {
      showCustomSnackbar(context, 'Gagal masuk dengan akun Google');
    }
  }

  void handleFacebookLogin() async {
    FacebookService facebookAuthService = FacebookService();
    final userData = await facebookAuthService.login();

    if (userData != null) {
      final accessToken = facebookAuthService.accessToken?.token;
      context.read<AuthBloc>().add(AuthFacebookEvent(accessToken!));
    } else {
      showCustomSnackbar(context, 'Gagal masuk dengan akun Facebook');
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
          if (state is TokenExpired) {
            showCustomSnackbar(context, state.text);
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          }
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
            );
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
                      Center(
                        child: Text1(
                          text1: AppLocalizations.of(context)!.descTopLog,
                          size: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        icon: Icons.email,
                        label: AppLocalizations.of(context)!.labelTextEmail,
                        controller: emailController,
                      ),
                      const SizedBox(height: 7),
                      CustomTextField(
                        icon: Icons.lock,
                        icon2: Icons.visibility_off,
                        obscureText: true,
                        label: AppLocalizations.of(context)!.labelTextPassword,
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
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text1(
                              text1:
                                  AppLocalizations.of(context)!.forgetPassword,
                              color: AppColors.buttonColor,
                              size: 13,
                            ),
                          ),
                        ),
                      ),
                      CustomButton(
                        text: AppLocalizations.of(context)!.textLogin,
                        onTap: handleLogin,
                      ),
                      Center(
                        child: Text2(
                          text2: AppLocalizations.of(context)!.textOr,
                        ),
                      ),
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
                      const SizedBox(height: 150),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text1(
                            text1:
                                '${AppLocalizations.of(context)!.descBottomLog}? ',
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const Register()),
                              );
                            },
                            child: Text1(
                              text1: AppLocalizations.of(context)!.textRegister,
                              color: AppColors.buttonColor,
                              fontWeight: FontWeight.bold,
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
