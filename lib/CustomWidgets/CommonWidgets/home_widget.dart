import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/user/user_profile/user_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext1.dart';
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
                text1: 'Hi, ${state.data.name}',
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
        Container(
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
      ],
    );
  }
}
