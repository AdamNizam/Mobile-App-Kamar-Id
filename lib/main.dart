import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hotelbookingapp/Blocs/auth/auth_bloc.dart';
import 'package:hotelbookingapp/Blocs/filter/filter_hotel_bloc.dart';
import 'package:hotelbookingapp/Blocs/hotel/hotel_bloc.dart';
import 'package:hotelbookingapp/Blocs/review_booking/review_bloc.dart';
import 'package:hotelbookingapp/Blocs/user/data_user/user_bloc.dart';
import 'package:hotelbookingapp/Blocs/user/user_update/update_user_bloc.dart';
import 'package:hotelbookingapp/Blocs/wishlist/post_wishlist/post_wishlist_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CommonWidgets/splash_screen.dart';
import 'package:hotelbookingapp/Screens/Authentication/login_screen.dart';
import 'package:hotelbookingapp/Screens/Authentication/register.dart';
import 'package:hotelbookingapp/Screens/HomeScreen/bottom_navigation.dart';
import 'package:hotelbookingapp/Themes/colors.dart';
import 'package:hotelbookingapp/root.dart';

void main() {
  runApp(const AppRoot());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc()..add(AuthGetCurrentUser()),
          ),
          BlocProvider(
            create: (context) => HotelBloc()..add(GetAllHotels()),
          ),
          BlocProvider(
            create: (context) => UserBloc()..add(GetUserProfile()),
          ),
          BlocProvider(
            create: (context) => PostWishlistBloc(),
          ),
          BlocProvider(
            create: (context) => UpdateUserBloc(),
          ),
          BlocProvider(
            create: (context) => ReviewBloc(),
          ),
          BlocProvider(
            create: (context) => FilterHotelBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Kamar.Id',
          locale: const Locale('en', 'Eg'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
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
