// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hotelbookingapp/main.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();

  static _AppRootState? of(BuildContext context) =>
      context.findAncestorStateOfType<_AppRootState>();
}

class _AppRootState extends State<AppRoot> {
  Key appKey = UniqueKey();

  void resetAppState() {
    setState(() {
      appKey = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyApp(key: appKey);
  }
}
