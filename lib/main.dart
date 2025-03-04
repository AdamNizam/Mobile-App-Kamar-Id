import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/auth/auth_bloc.dart';
import 'package:hotelbookingapp/Blocs/hotel/hotel_bloc.dart';
import 'package:hotelbookingapp/CommonWidgets/splash_screen.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Screens/Authentication/login.dart';
import 'package:hotelbookingapp/Screens/Authentication/message_register_success.dart';
import 'package:hotelbookingapp/Screens/Authentication/register.dart';
import 'package:hotelbookingapp/Screens/BookMark/book_marks_screen.dart';
import 'package:hotelbookingapp/Screens/Categories/all_categories.dart';
import 'package:hotelbookingapp/Screens/FavoriteHotels/favorite_hotels.dart';
import 'package:hotelbookingapp/Screens/HomeScreen/bottom_navigation.dart';
import 'package:hotelbookingapp/Screens/MyBookings/cancelledbooking.dart';
import 'package:hotelbookingapp/Screens/MyBookings/completed_bookings.dart';
import 'package:hotelbookingapp/Screens/MyBookings/my_bookings.dart';
import 'package:hotelbookingapp/Screens/Notifications/notifications.dart';
import 'package:hotelbookingapp/Screens/Profile/profile_screen.dart';
import 'package:hotelbookingapp/Screens/Reviews/reviews.dart';
import 'package:hotelbookingapp/Screens/Search/search_typing.dart';
import 'package:hotelbookingapp/Screens/Settings/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Hotel Booking',
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.bgColor,
            useMaterial3: true,
          ),
          routes: {
            '/': (context) => const SplashScreen(),
            '/login': (context) => const LogIn(),
            '/register': (context) => const Register(),
            '/message-success-register': (context) =>
                const MessageRegisterSuccess(),
            '/home': (context) => const BottomNavigationHome(),
            '/profile': (context) => const ProfileScreen(),
            '/reviews': (context) => const Reviews(),
            '/categories': (context) => const AllCategoriesScreen(),
            '/settings': (context) => const SettingsScreen(),
            '/notifications': (context) => const BookingNotifications(),
            '/search-typing': (context) => const SearchTyping(),
            '/my-booking': (context) => const MyBookingsScreen(),
            '/cancel-booking': (context) => const CancelledBooking(),
            '/completed-booking': (context) => const CompletedBooking(),
            '/favorite-hotels': (context) => const FavoriteHotels(),
            '/bookmark': (context) => const BookMarkHotel(),
          },
        ));
  }
}
