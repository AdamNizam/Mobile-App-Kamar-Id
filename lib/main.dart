import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/auth/auth_bloc.dart';
import 'package:hotelbookingapp/Blocs/hotel/hotel_bloc.dart';
import 'package:hotelbookingapp/Blocs/notification/notification_bloc.dart';
import 'package:hotelbookingapp/Blocs/review_booking/review_bloc.dart';
import 'package:hotelbookingapp/Blocs/user/user_profile/user_bloc.dart';
import 'package:hotelbookingapp/Blocs/user/user_update/update_user_bloc.dart';
import 'package:hotelbookingapp/Blocs/wishlist/get_wishlist/get_wishlist_bloc.dart';
import 'package:hotelbookingapp/Blocs/wishlist/post_wishlist/post_wishlist_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CommonWidgets/splash_screen.dart';
import 'package:hotelbookingapp/Screens/Authentication/login.dart';
import 'package:hotelbookingapp/Screens/Authentication/register.dart';
import 'package:hotelbookingapp/Screens/Categories/all_categories.dart';
import 'package:hotelbookingapp/Screens/HistoryBookings/cancelled_bookings.dart';
import 'package:hotelbookingapp/Screens/HistoryBookings/completed_bookings.dart';
import 'package:hotelbookingapp/Screens/HomeScreen/Search/search_typing.dart';
import 'package:hotelbookingapp/Screens/HomeScreen/bottom_navigation.dart';
import 'package:hotelbookingapp/Screens/Profile/profile_screen.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

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
          BlocProvider(
            create: (context) => UserBloc()..add(GetUserProfile()),
          ),
          BlocProvider(
            create: (context) => NotificationBloc()
              ..add(const FetchAllNotifications(
                unreadRequest: 'read',
                readRequest: 'read',
              )),
          ),
          BlocProvider(
            create: (context) => PostWishlistBloc(),
          ),
          BlocProvider(
            create: (context) => GetWishlistBloc()..add(GetData()),
          ),
          BlocProvider(
            create: (context) => UpdateUserBloc(),
          ),
          BlocProvider(
            create: (context) => ReviewBloc(),
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
            '/login': (context) => const Login(),
            '/register': (context) => const Register(),
            '/home': (context) => const BottomNavigationHome(),
            '/profile': (context) => const ProfileScreen(),
            '/categories': (context) => const AllCategoriesScreen(),
            '/search-typing': (context) => const SearchTyping(),
            '/cancel-booking': (context) => const CancelledBooking(),
            '/completed-booking': (context) => const CompletedBooking(),
          },
        ));
  }
}
