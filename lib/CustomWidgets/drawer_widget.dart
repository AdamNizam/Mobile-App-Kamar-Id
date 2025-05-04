import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Screens/HistoryBookings/my_bookings.dart';
import 'package:hotelbookingapp/Screens/HomeScreen/Search/search_hotels.dart';
import 'package:hotelbookingapp/Screens/WishlistHotel/favorite_hotels.dart';

import '../Screens/HomeScreen/home_screen.dart';
import '../Screens/MessagesFlow/direct_messages.dart';
import '../Screens/Profile/profile_screen.dart';
import '../Screens/Reviews/reviews.dart';
import '../Screens/Settings/settings_screen.dart';
import 'CustomText/detailstext1.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String selectedMenuItem = ''; // Track the selected menu item

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 60),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.only(left: 20, right: 5, top: 10),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset('images/c3.png'),
            ),
            title: const Text(
              'Hey!',
              style: TextStyle(),
            ),
            subtitle: const Text1(text1: 'James Powell'),
          ),
          const SizedBox(
            height: 10.0,
          ),
          buildMenuItem(
            title: "Homepage",
            icon: Icons.home,
            onTap: () {
              navigateTo(const HomePage());
            },
          ),
          const SizedBox(height: 3),
          const SizedBox(height: 3),
          buildMenuItem(
            title: "My Bookings",
            icon: Icons.book_online,
            onTap: () {
              navigateTo(const MyBookingsScreen());
            },
          ),
          const SizedBox(height: 3),
          buildMenuItem(
            title: "Search Hotels",
            icon: Icons.search,
            onTap: () {
              navigateTo(const SearchHotel());
            },
          ),
          const SizedBox(height: 3),
          buildMenuItem(
            title: "Favorite",
            icon: Icons.favorite,
            onTap: () {
              navigateTo(const FavoriteHotels());
            },
          ),
          const SizedBox(height: 3),
          buildMenuItem(
            title: "Notifications",
            icon: Icons.notifications,
            onTap: () {},
          ),
          const SizedBox(height: 3),
          buildMenuItem(
            title: "Messages",
            icon: Icons.message,
            onTap: () {
              navigateTo(const DirectMessages());
            },
          ),
          const SizedBox(height: 3),
          buildMenuItem(
            title: "Profile",
            icon: Icons.person,
            onTap: () {
              navigateTo(const ProfileScreen());
            },
          ),
          const SizedBox(height: 3),
          buildMenuItem(
            title: "Reviews",
            icon: Icons.rate_review,
            onTap: () {
              navigateTo(const Reviews());
            },
          ),
          const SizedBox(height: 3),
          buildMenuItem(
            title: "Settings",
            icon: Icons.settings,
            onTap: () {
              navigateTo(const SettingsScreen());
            },
          ),
          const SizedBox(height: 3),
          const Divider(
            thickness: 1,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.logout,
              color: Colors.redAccent,
              size: 20,
            ),
            title: const Text(
              "Logout",
              style: TextStyle(
                fontSize: 16,
                color: Colors.redAccent,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    bool isSelected = title == selectedMenuItem;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: const EdgeInsets.only(right: 30, top: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: const Border(),
        color: isSelected ? Colors.green : null, // Highlight selected item
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedMenuItem = title;
          });
          onTap();
        },
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? Colors.white : Colors.black,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.navigate_next,
              size: 20,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  void navigateTo(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
