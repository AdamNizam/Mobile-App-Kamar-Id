import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/auth/auth_bloc.dart';
import 'package:hotelbookingapp/Screens/Profile/user_infromation.dart';
import 'package:hotelbookingapp/Screens/Wallet/wallet_screen.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';

import '../../Constants/colors.dart';
import '../Settings/settings_screen.dart';
import 'HelpCenter/help_center.dart';
import 'PaymentMethods/payment_methods.dart';
import 'change_password.dart';
import 'invite_friends.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          }
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: SizedBox(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(
                  strokeWidth: 4.0,
                  backgroundColor: Colors.grey[300],
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(AppColors.tabColor),
                ),
              ),
            );
          }
          return SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        AssetImage('images/c3.png'), // Example profile picture
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    'John Doe', // Example username
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text1Color,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                const Center(
                  child: Text(
                    'john.doe@example.com', // Example email
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.text2Color,
                    ),
                  ),
                ),
                ProfileRow(
                  leadingIcon: Icons.person, // Updated icon for profile
                  title: 'Your Profile',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const UserInformation()));
                  },
                ),
                ProfileRow(
                  leadingIcon: Icons.person, // Updated icon for profile
                  title: 'Wallet',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const WalletScreen()));
                  },
                ),
                ProfileRow(
                  leadingIcon: Icons.person, // Updated icon for profile
                  title: 'Invite Friends',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => InviteFriendsScreen()));
                  },
                ),
                ProfileRow(
                  leadingIcon:
                      Icons.credit_card, // Updated icon for payment methods
                  title: 'Payment Methods',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PaymentMethods()));
                  },
                ),
                ProfileRow(
                  leadingIcon: Icons.lock, // Updated icon for change password
                  title: 'Change Password',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ChangePassword()));
                  },
                ),
                ProfileRow(
                  leadingIcon: Icons.settings, // Updated icon for settings
                  title: 'Settings',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SettingsScreen()));
                  },
                ),
                ProfileRow(
                  leadingIcon: Icons.help, // Updated icon for help center
                  title: 'Help Center',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HelpCenterScreen()));
                  },
                ),
                ProfileRow(
                  leadingIcon: Icons.logout, // Updated icon for help center
                  title: 'Logout',
                  onTap: () {
                    context.read<AuthBloc>().add(AuthLogout());
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ProfileRow extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final VoidCallback onTap;

  const ProfileRow({
    required this.leadingIcon,
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 3),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              leadingIcon,
              color: AppColors.tabColor,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.tabColor,
            ),
          ],
        ),
      ),
    );
  }
}
