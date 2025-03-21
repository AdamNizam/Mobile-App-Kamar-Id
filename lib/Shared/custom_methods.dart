import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CommonWidgets/splash_screen.dart';
import 'package:hotelbookingapp/Screens/offline_mode_screen.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class CheckInternetScreen extends StatefulWidget {
  const CheckInternetScreen({super.key});

  @override
  _CheckInternetScreenState createState() => _CheckInternetScreenState();
}

class _CheckInternetScreenState extends State<CheckInternetScreen> {
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;
  StreamSubscription<InternetStatus>? _internetSubscription;
  bool isOnline = true;

  @override
  void initState() {
    super.initState();
    _checkRealTimeInternetStatus();

    // Pantau perubahan koneksi dengan Connectivity Plus
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      _checkRealTimeInternetStatus();
    });

    // Pantau perubahan akses internet secara langsung
    _internetSubscription =
        InternetConnection().onStatusChange.listen((status) {
      if (!mounted) return; // Pastikan widget masih aktif

      bool newStatus = status == InternetStatus.connected;
      if (isOnline != newStatus) {
        if (mounted) {
          setState(() {
            isOnline = newStatus;
          });

          _showSnackBar(isOnline);
        }

        if (!isOnline) {
          redirectToOfflinePage();
        } else {
          redirectToHomePage();
        }
      }
    });
  }

  // Cek akses internet secara real-time
  Future<void> _checkRealTimeInternetStatus() async {
    bool hasInternet = await InternetConnection().hasInternetAccess;
    if (!mounted) return;

    setState(() {
      isOnline = hasInternet;
    });

    _showSnackBar(isOnline);
    if (!isOnline) {
      redirectToOfflinePage();
    } else {
      redirectToHomePage();
    }
  }

  // Notifikasi perubahan status koneksi
  void _showSnackBar(bool isConnected) {
    if (!mounted ||
        (ScaffoldMessenger.maybeOf(context)?.mounted ?? false) == false) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(isConnected
              ? "Koneksi internet tersambung!"
              : "Koneksi terputus!"),
        ),
        backgroundColor: isConnected ? Colors.green : Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // Pindah ke halaman offline
  void redirectToOfflinePage() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (ModalRoute.of(context)?.isCurrent != true)
        return; // Hindari navigasi ganda

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OfflineModeScreen()),
      );
    });
  }

  // Pindah ke halaman utama saat kembali online
  void redirectToHomePage() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (ModalRoute.of(context)?.isCurrent != true) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SplashScreen()),
      );
    });
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    _internetSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          isOnline ? "You're Online" : "You're Offline",
          style: TextStyle(
            color: isOnline ? Colors.green : Colors.red,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
