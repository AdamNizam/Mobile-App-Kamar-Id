// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/auth/auth_bloc.dart';
import 'package:hotelbookingapp/Blocs/user/data_user/user_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext1.dart';
import 'package:hotelbookingapp/Screens/Profile/HelpCenter/customer_service.dart';
import 'package:hotelbookingapp/Screens/Profile/user_infromation.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';
import 'package:hotelbookingapp/app_state_wrapper.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../Settings/settings_screen.dart';
import 'change_password.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, authState) {
        if (authState is AuthSuccess) {
          AppStateWrapper.of(context)?.restartApp();
        }
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
                const SizedBox(height: 5),
                BlocConsumer<UserBloc, UserState>(
                  listener: (context, userState) {
                    if (userState is UserFailed) {
                      showCustomSnackbar(context, userState.error);
                    }
                  },
                  builder: (context, userState) {
                    if (userState is UserLoading) {
                      return Center(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                          color: AppColors.tabColor,
                          size: 30,
                        ),
                      );
                    }
                    if (userState is UserSuccess) {
                      return Column(
                        children: [
                          const SizedBox(height: 20),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.white,
                                  width: 3,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    (userState.data.avatarThumbUrl == null ||
                                            userState
                                                .data.avatarThumbUrl!.isEmpty)
                                        ? const AssetImage(
                                            'images/user_default_profile.png',
                                          )
                                        : NetworkImage(
                                            userState.data.avatarThumbUrl!,
                                          ) as ImageProvider<Object>,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            userState.data.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            userState.data.email,
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
