// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hotelbookingapp/Blocs/auth/auth_bloc.dart';
import 'package:hotelbookingapp/Blocs/chat/get_contact/get_contact_bloc.dart';
import 'package:hotelbookingapp/Blocs/filter/filter_hotel_bloc.dart';
import 'package:hotelbookingapp/Blocs/forget_password/forget_password_bloc.dart';
import 'package:hotelbookingapp/Blocs/hotel/hotel_bloc.dart';
import 'package:hotelbookingapp/Blocs/review_booking/review_bloc.dart';
import 'package:hotelbookingapp/Blocs/user/user_data/user_bloc.dart';
import 'package:hotelbookingapp/Blocs/user/user_update/update_user_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/splash_screen.dart';
import 'package:hotelbookingapp/Screens/Authentication/login_screen.dart';
import 'package:hotelbookingapp/Screens/Authentication/register.dart';
import 'package:hotelbookingapp/Screens/HomeScreen/bottom_navigation.dart';
import 'package:hotelbookingapp/Themes/colors.dart';
import 'package:hotelbookingapp/locale_cubit.dart';

Future<void> main() async {
  runApp(const AppRoot());
}

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();

  static _AppRootState? of(BuildContext context) =>
      context.findAncestorStateOfType<_AppRootState>();
}

class _AppRootState extends State<AppRoot> {
  Key appKey = UniqueKey();

  void resetAppState() {
    setState(() {
      appKey = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LocaleCubit(),
      child: MyApp(key: appKey),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, locale) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => AuthBloc()..add(AuthGetCurrentUser())),
            BlocProvider(create: (_) => HotelBloc()..add(GetAllHotels())),
            BlocProvider(create: (_) => UserBloc()..add(GetUserProfile())),
            BlocProvider(create: (_) => UpdateUserBloc()),
            BlocProvider(create: (_) => ReviewBloc()),
            BlocProvider(create: (_) => FilterHotelBloc()),
            BlocProvider(create: (_) => ForgetPasswordBloc()),
            BlocProvider(create: (_) => GetContactBloc()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Kamar.Id',
            locale: locale,
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
          ),
        );
      },
    );
  }
}
