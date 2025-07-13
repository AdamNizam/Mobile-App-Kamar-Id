// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hotelbookingapp/Blocs/auth/auth_bloc.dart';
import 'package:hotelbookingapp/Blocs/user/user_data/user_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/Screens/Profile/HelpCenter/customer_service.dart';
import 'package:hotelbookingapp/Screens/Profile/user_infromation.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';
import 'package:hotelbookingapp/locale_cubit.dart';
import 'package:hotelbookingapp/main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../Settings/settings_screen.dart';
import 'change_password.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: userState.data.emailVerifiedAt != null
                                      ? AppColors.white
                                      : AppColors.redAwesome,
                                  width: 3,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 35,
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
                            // Icon X di pojok kanan atas
                            Positioned(
                              right: 0,
                              bottom: 8,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: userState.data.emailVerifiedAt != null
                                      ? AppColors.green
                                      : AppColors.redAwesome,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  userState.data.emailVerifiedAt != null
                                      ? Icons.check
                                      : Icons.close,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (userState.data.emailVerifiedAt == null)
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text1(
                                    text1:
                                        '${AppLocalizations.of(context)!.messageEmailNotVerirfied}, ',
                                    size: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.redAwesome,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text1(
                                text1: 'Verify Now',
                                color: AppColors.white,
                                size: 14,
                              ),
                            ),
                          ],
                        ),
                      if (userState.data.emailVerifiedAt != null)
                        Column(
                          children: [
                            const SizedBox(height: 10),
                            Text1(
                              text1: userState.data.name ??
                                  AppLocalizations.of(context)!.textNoInfo,
                              size: 16,
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            const SizedBox(height: 4),
                            Text1(
                              text1: userState.data.email ?? '',
                              size: 15,
                              color: AppColors.cadetGray,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                    ],
                  );
                }
                return Container();
              },
            ),
            const SizedBox(height: 10),
            ProfileRow(
              leadingIcon: Icons.person,
              title: AppLocalizations.of(context)!.textYourProfile,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UserInformation()));
              },
            ),
            ProfileRow(
              leadingIcon: Icons.lock,
              title: AppLocalizations.of(context)!.textChangePassword,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ChangePassword()));
              },
            ),
            ProfileRow(
              leadingIcon: Icons.settings,
              title: AppLocalizations.of(context)!.textSettings,
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
              leadingIcon: Icons.language,
              title: 'Languages',
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  builder: (context) {
                    return const LanguageSelector();
                  },
                );
              },
            ),
            ProfileRow(
              leadingIcon: Icons.logout,
              title: AppLocalizations.of(context)!.textLogout,
              onTap: () {
                AppRoot.of(context)?.resetAppState();
                context.read<AuthBloc>().add(AuthLogout());
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.watch<LocaleCubit>().state;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Pilih Bahasa",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Indonesia Option
          ListTile(
            leading: const Text("🇮🇩"),
            title: const Text("Bahasa Indonesia"),
            trailing: currentLocale.languageCode == 'id'
                ? const Icon(Icons.check, color: Colors.green)
                : null,
            onTap: () {
              context.read<LocaleCubit>().switchToIndonesian();
              Navigator.pop(context);
            },
          ),

          // English Option
          ListTile(
            leading: const Text("🇺🇸"),
            title: const Text("English"),
            trailing: currentLocale.languageCode == 'en'
                ? const Icon(Icons.check, color: Colors.green)
                : null,
            onTap: () {
              context.read<LocaleCubit>().switchToEnglish();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
