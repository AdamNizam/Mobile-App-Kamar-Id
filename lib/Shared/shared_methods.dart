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

String formatDuration(Duration duration) {
  final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
  final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  return '$minutes:$seconds';
}

DateTime formatDateToYMD(DateTime date) {
  String formatted = DateFormat('yyyy-MM-dd').format(date);
  return DateFormat('yyyy-MM-dd').parse(formatted);
}

String formatMidtransGrossAmount(String amountString) {
  final formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  double amount = double.tryParse(amountString) ?? 0;
  return formatter.format(amount.toInt());
}

// example : 07/06/2025
String formatDateToSlash(DateTime dateTime) {
  return DateFormat('dd/MM/yyyy').format(dateTime);
}
