import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/user/user_bloc.dart';

import '../../../Widgets/detailstext1.dart';

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
              Text1(
                text1: state.userProfile.userName != null
                    ? 'Hi, ${state.userProfile.userName}'
                    : 'Hi, You',
                size: 16,
                color: Colors.white,
              ),
              ClipOval(
                child: Image.network(
                  "https://randomuser.me/api/portraits/men/1.jpg",
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              )
            ],
          );
        }
        return Container();
      },
    );
  }
}
