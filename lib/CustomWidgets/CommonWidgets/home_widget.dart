import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hotelbookingapp/Blocs/notification/notication_bloc.dart';
import 'package:hotelbookingapp/Blocs/user/data_user/user_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/Screens/Notifications/notifications_screen.dart';
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
              return Text1(
                text1: AppLocalizations.of(context)!
                    .textHi(state.data.name ?? 'you'),
                size: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              );
            }
            return const Text1(
              text1: 'Hi, you',
              size: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            );
          },
        ),
        BlocProvider(
          create: (context) => NoticationBloc()
            ..add(
              const GetAllMessage(typeUnred: 'unread', typeread: 'read'),
            ),
          child: BlocBuilder<NoticationBloc, NoticationState>(
            builder: (context, state) {
              if (state is NoticationSuccess) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NotificationScreen(
                          unreadData: state.unreadData.rows,
                          readData: state.readData.rows,
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
                          Icons.notifications_active,
                          color: AppColors.buttonColor,
                          size: 26,
                        ),
                        Positioned(
                          right: -2,
                          top: -4,
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
                                fontSize: 6,
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
        ),
      ],
    );
  }
}
