import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/auth/auth_bloc.dart';
import 'package:hotelbookingapp/Models/sign_in_form_model.dart';
import 'package:hotelbookingapp/Screens/Authentication/register.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';

import '../../Constants/colors.dart';
import '../../Widgets/custombtn.dart';
import '../../Widgets/customtextfield.dart';
import '../../Widgets/detailstext2.dart';
import 'forgotpassword.dart';
import 'getstarted.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.error);
            print('eror login  ${state.error}');
          }
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  strokeWidth: 6.0,
                  backgroundColor: Colors.grey[300],
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(AppColors.redDark),
                ),
              ),
            );
          }
          return SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
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
                                  fontSize: 26,
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
                      CustomButton(
                        text: 'Log In',
                        onTap: () {
                          if (validate()) {
                            context.read<AuthBloc>().add(
                                  AuthLogin(
                                    SignInFormModel(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  ),
                                );
                          } else {
                            showCustomSnackbar(
                                context, 'enter your username & password');
                          }
                        },
                      ),
                      const Center(child: Text2(text2: 'Or')),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Do you want create new account? "),
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
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}
