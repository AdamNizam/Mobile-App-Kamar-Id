import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/chat/get_contact/get_contact_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CommonWidgets/chat_tittle_widget.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomBar/customapp_top_bar.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MessageScreen extends StatefulWidget {
  final VoidCallback? onBack;
  const MessageScreen({super.key, this.onBack});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppTopBar(
        title: 'Message',
        icon: Icons.more_vert,
        onPop: () {
          if (widget.onBack != null) {
            widget.onBack!();
          }
        },
        onTap: () {
          showCustomSnackbar(context, 'fitur is not available');
        },
      ),
      body: BlocProvider(
        create: (context) => GetContactBloc()..add(FetchContactEvent()),
        child: BlocConsumer<GetContactBloc, GetContactState>(
          listener: (context, getContactState) {
            if (getContactState is GetContactFailed) {
              showCustomSnackbar(context, getContactState.error);
            }
          },
          builder: (context, getContactState) {
            if (getContactState is GetContactLoading) {
              return Center(
                child: LoadingAnimationWidget.hexagonDots(
                  color: AppColors.buttonColor,
                  size: 50,
                ),
              );
            }
            return Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: const Icon(Icons.search, size: 20),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      filled: true,
                      fillColor: AppColors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                            color: AppColors.beauBlue, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                            color: AppColors.beauBlue, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                            color: AppColors.amberColor, width: 1),
                      ),
                    ),
                  ),
                ),
                if (getContactState is GetContactSuccess)
                  Expanded(
                    child: Column(
                        children: getContactState.data.contacts!.map((data) {
                      return ChatTile(
                        data: data,
                        message: 'hello',
                        time: '12:00',
                        unreadCount: 1,
                        avatar: 'https://i.pravatar.cc/150?img=10',
                      );
                    }).toList()),
                  ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.buttonColor,
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }
}
