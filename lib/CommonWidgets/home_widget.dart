import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Blocs/user/user_bloc.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';

class HomeWidgte extends StatelessWidget {
  const HomeWidgte({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserSuccess) {
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
                    color: Colors.white,
                  ),
                );
              }),
              Text(
                'Hi, ${state.data.lastName}',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                  letterSpacing: 1.2,
                ),
              ),
              ClipOval(
                child: Image.asset(
                  'images/user_default_profile.png',
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
                // child: Image.network(
                //   "https://randomuser.me/api/portraits/men/1.jpg",
                //   width: 40,
                //   height: 40,
                //   fit: BoxFit.cover,
                // ),
              ),
            ],
          );
        }
        if (state is UserFailed) {
          showCustomSnackbar(context, state.error);
        }
        return Container();
      },
    );
  }
}
