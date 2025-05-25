import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Blocs/notification/notification_bloc.dart';
import 'package:hotelbookingapp/Blocs/user/user_profile/user_bloc.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class HomeWidgte extends StatefulWidget {
  const HomeWidgte({
    super.key,
  });

  @override
  State<HomeWidgte> createState() => _HomeWidgteState();
}

class _HomeWidgteState extends State<HomeWidgte> {
  int totalNotification = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Builder(builder: (context) {
          return InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: const Icon(
              Icons.menu_outlined,
              color: AppColors.white,
            ),
          );
        }),
        BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserSuccess) {
              return Text(
                'Hi, ${state.data.lastName}',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                  letterSpacing: 1.2,
                ),
              );
            }
            return Text(
              'Hi, you',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
                letterSpacing: 1.2,
              ),
            );
          },
        ),
        BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (state is NotificationSuccess) {
                showCustomSnackbar(context, 'Get Data Notication sucess');
              }
              if (state is NotificationFailed) {
                showCustomSnackbar(context, state.error);
              }
            });
            return GestureDetector(
              onTap: () {
                context.read<NotificationBloc>().add(GetUnreadNoticiation());
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.notifications_off,
                  color: AppColors.cadetGray,
                  size: 24,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
