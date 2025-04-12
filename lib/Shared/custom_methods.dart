import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef CountdownCallback = void Function(Duration remainingTime);

class CountdownTimerUtil {
  static Timer startCountdown({
    required DateTime expiryTime,
    required CountdownCallback onTick,
    required VoidCallback onExpired,
  }) {
    return Timer.periodic(const Duration(seconds: 1), (_) {
      final now = DateTime.now();
      final diff = expiryTime.difference(now);

      if (diff.isNegative) {
        onExpired();
      } else {
        onTick(diff);
      }
    });
  }
}

IconData getIcon(String iconName) {
  switch (iconName) {
    // IcoFont icons
    case 'icofont-tea':
      return Icons.coffee;
    case 'icofont-wifi-alt':
      return Icons.wifi;
    case 'icofont-recycle-alt':
      return Icons.dry_cleaning;
    case 'icofont-imac':
      return Icons.desktop_mac_outlined;
    case 'icofont-wall-clock':
      return Icons.alarm;
    case 'icofont-education':
      return Icons.school;
    case 'fa fa-hospital-o':
      return Icons.local_hospital;
    case 'fa fa-subway':
      return Icons.flight_takeoff;
    default:
      return Icons.close;
  }
}

int extractNumber(String text) {
  String cleaned = text.replaceAll(RegExp(r'[^\d.]'), '');
  cleaned = cleaned.replaceAll('.', '');
  return int.tryParse(cleaned) ?? 0;
}

String formatToRp(int number) {
  final formatter = NumberFormat('#,###', 'id_ID');
  return formatter.format(number).replaceAll(',', '.');
}

String formatToUsd(double number) {
  final formatter = NumberFormat('#,###.00', 'en_US');
  return '\$${formatter.format(number)}';
}

String idrToUsd(int number, {double exchangeRate = 16560}) {
  double usdValue = number / exchangeRate;
  final formatter = NumberFormat('#,###.##', 'en_US');
  return '\$${formatter.format(usdValue)}';
}

String usdToIdr(double usd, {double exchangeRate = 16560}) {
  double idrValue = usd * exchangeRate;
  final formatter = NumberFormat('#,###', 'id_ID');
  return 'Rp${formatter.format(idrValue)}';
}

String countNights(DateTime checkIn, DateTime checkOut) {
  final nights = checkOut.difference(checkIn).inDays;
  return "/$nights night${nights > 1 ? 's' : ''}";
}
