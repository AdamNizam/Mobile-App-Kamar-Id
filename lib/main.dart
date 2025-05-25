import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/auth/auth_bloc.dart';
import 'package:hotelbookingapp/Blocs/hotel/hotel_bloc.dart';
import 'package:hotelbookingapp/Blocs/notification/notification_bloc.dart';
import 'package:hotelbookingapp/Blocs/review_booking/review_bloc.dart';
import 'package:hotelbookingapp/Blocs/user/user_profile/user_bloc.dart';
import 'package:hotelbookingapp/Blocs/user/user_update/update_user_bloc.dart';
import 'package:hotelbookingapp/Blocs/wishlist/post_wishlist/post_wishlist_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CommonWidgets/splash_screen.dart';
import 'package:hotelbookingapp/Screens/Authentication/login_screen.dart';
import 'package:hotelbookingapp/Screens/Authentication/register.dart';
import 'package:hotelbookingapp/Screens/HomeScreen/bottom_navigation.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc()..add(AuthGetCurrentUser()),
          ),
          BlocProvider<HotelBloc>(
            create: (context) => HotelBloc()..add(GetAllHotels()),
          ),
          BlocProvider<UserBloc>(
            create: (context) => UserBloc()..add(GetUserProfile()),
          ),
          BlocProvider<NotificationBloc>(
            create: (context) => NotificationBloc(),
          ),
          BlocProvider<PostWishlistBloc>(
            create: (context) => PostWishlistBloc(),
          ),
          BlocProvider<UpdateUserBloc>(
            create: (context) => UpdateUserBloc(),
          ),
          BlocProvider<ReviewBloc>(
            create: (context) => ReviewBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Kamar.Id',
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.bgColor,
            useMaterial3: true,
          ),
          routes: {
            '/': (context) => const SplashScreen(),
            '/login': (context) => const Login(),
            '/register': (context) => const Register(),
            '/home': (context) => const BottomNavigationHome(),
          },
        ));
  }
}
