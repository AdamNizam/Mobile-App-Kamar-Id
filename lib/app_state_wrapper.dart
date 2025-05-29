import 'package:flutter/material.dart';

import 'main.dart';

class AppStateWrapper extends StatefulWidget {
  const AppStateWrapper({super.key});

  @override
  State<AppStateWrapper> createState() => _AppStateWrapperState();

  // ignore: library_private_types_in_public_api
  static _AppStateWrapperState? of(BuildContext context) =>
      context.findAncestorStateOfType<_AppStateWrapperState>();
}

class _AppStateWrapperState extends State<AppStateWrapper> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: const MyApp(),
    );
  }
}
