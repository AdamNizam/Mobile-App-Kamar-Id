import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CommonWidgets/drawer_widget.dart';
import 'package:hotelbookingapp/Screens/HistoryBookings/my_bookings.dart';
import 'package:hotelbookingapp/Screens/HomeScreen/home_screen.dart';
import 'package:hotelbookingapp/Screens/Messages/message_screen.dart';
import 'package:hotelbookingapp/Screens/Profile/profile_screen.dart';
import 'package:hotelbookingapp/Screens/WishlistHotel/favorite_hotels.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class BottomNavigationHome extends StatefulWidget {
  const BottomNavigationHome({super.key});

  @override
  State<BottomNavigationHome> createState() => _BottomNavigationHomeState();
}

class _BottomNavigationHomeState extends State<BottomNavigationHome> {
  int _selectedIndex = 0;

  List<Widget> get _pages => [
        const HomePage(),
        MyBookingsScreen(
          onBack: () {
            setState(() {
              _selectedIndex = 0;
            });
          },
        ),
        MessageScreen(
          onBack: () {
            setState(() {
              _selectedIndex = 0;
            });
          },
        ),
        FavoriteHotels(
          onBack: () {
            setState(() {
              _selectedIndex = 0;
            });
          },
        ),
        const ProfileScreen(),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'history',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: 'Pesan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Wishlist',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            backgroundColor: AppColors.white,
            selectedItemColor: AppColors.tabColor,
            unselectedItemColor: AppColors.cadetGray,
            elevation: 0,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}
