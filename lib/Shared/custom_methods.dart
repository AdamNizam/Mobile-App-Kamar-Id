import 'package:flutter/material.dart';

IconData getIcon(String iconName) {
  switch (iconName) {
    // IcoFont icons
    case 'icofont-tea':
      return Icons.coffee;
    case 'icofont-wifi-alt':
      return Icons.wifi;
    case 'icofont-recycle-alt':
      return Icons.clean_hands;
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
