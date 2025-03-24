import 'package:flutter/material.dart';

IconData getIcon(String iconName) {
  switch (iconName) {
    // IcoFont icons
    case 'icofont-tea':
      return Icons.coffee;
    case 'icofont-wifi-alt':
      return Icons.wifi;
    case 'icofont-recycle-alt':
      return Icons.local_laundry_service;
    case 'icofont-imac':
      return Icons.image;
    case 'icofont-wall-clock':
      return Icons.alarm;

    default:
      return Icons.close;
  }
}
