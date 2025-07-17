import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomBar/customapp_top_bar.dart';

import 'help_screen.dart';

class HelpDetailScreen extends StatelessWidget {
  final HelpTopic topic;

  const HelpDetailScreen({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            CustomAppTopBar(title: topic.title, onPop: () {}, onTap: () {}));
  }
}
