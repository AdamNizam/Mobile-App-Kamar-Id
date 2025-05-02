import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Blocs/notification/notification_bloc.dart';
import 'package:hotelbookingapp/Blocs/user/user_bloc.dart';
import 'package:hotelbookingapp/Screens/Notifications/notifications.dart';
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
            if (state is NotificationSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  totalNotification = state.data.rows.total;
                });
              });
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingNotifications(
                        unreadData: state.data.rows,
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(
                        Icons.notifications,
                        color: AppColors.buttonColor,
                        size: 26,
                      ),
                      Positioned(
                        right: -2,
                        top: -5,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: AppColors.redAwesome,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            totalNotification.toString(),
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 7,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Container(
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
            );
          },
        ),
      ],
    );
  }
}
