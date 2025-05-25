import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/auth/auth_bloc.dart';
import 'package:hotelbookingapp/Blocs/user/user_profile/user_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext1.dart';
import 'package:hotelbookingapp/Screens/Authentication/message_success.dart';
import 'package:hotelbookingapp/Screens/Profile/HelpCenter/customer_service.dart';
import 'package:hotelbookingapp/Screens/Profile/user_infromation.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:hotelbookingapp/Themes/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../Settings/settings_screen.dart';
import 'change_password.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, authState) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => const MessageSuccess(
              title: 'Logout Success!',
              message: 'your acount is log out in sistem',
            ),
          ),
          (Route<dynamic> route) => false,
        );
      },
      builder: (context, authState) {
        if (authState is AuthLoading) {
          return Center(
            child: LoadingAnimationWidget.hexagonDots(
              color: AppColors.tabColor,
              size: 50,
            ),
          );
        }
        return Scaffold(
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
              children: [
                const SizedBox(height: 20),
                const Center(
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                      'images/user_default_profile.png',
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                BlocConsumer<UserBloc, UserState>(
                  listener: (context, state) {
                    if (state is UserFailed) {
                      showCustomSnackbar(context, state.error);
                    }
                  },
                  builder: (context, Userstate) {
                    if (Userstate is UserLoading) {
                      return Center(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                          color: AppColors.tabColor,
                          size: 30,
                        ),
                      );
                    }
                    if (Userstate is UserSuccess) {
                      return Column(
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            Userstate.data.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            Userstate.data.email,
                            style: const TextStyle(
                              fontSize: 16,
                              color: AppColors.cadetGray,
                            ),
                          ),
                        ],
                      );
                    }
                    return const Center(
                      child: Text1(text1: "No data available"),
                    );
                  },
                ),
                const SizedBox(height: 10),
                ProfileRow(
                  leadingIcon: Icons.person,
                  title: 'Your Profile',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const UserInformation()));
                  },
                ),
                ProfileRow(
                  leadingIcon: Icons.lock,
                  title: 'Change Password',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ChangePassword()));
                  },
                ),
                ProfileRow(
                  leadingIcon: Icons.settings,
                  title: 'Settings',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SettingsScreen()));
                  },
                ),
                ProfileRow(
                    leadingIcon: Icons.support_agent,
                    title: 'Customer service',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CustomerServiceScreen()));
                    }),
                ProfileRow(
                  leadingIcon: Icons.logout,
                  title: 'Logout',
                  onTap: () {
                    context.read<AuthBloc>().add(AuthLogout());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
