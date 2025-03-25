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
    case 'icofont-education':
      return Icons.cast_for_education;
    case 'fa fa-hospital-o':
      return Icons.local_hospital;
    case 'fa fa-subway':
      return Icons.subway;
    default:
      return Icons.close;
  }
}
