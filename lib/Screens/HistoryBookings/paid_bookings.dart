import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hotelbookingapp/Blocs/booking/booking_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomCard/card_booking_paid.dart';
import 'package:hotelbookingapp/CustomWidgets/Shimmers/shimmer_list.dart';
import 'package:hotelbookingapp/CustomWidgets/default_value.dart';
import 'package:hotelbookingapp/Screens/Messages/no_messages.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class PaidBooking extends StatefulWidget {
  const PaidBooking({super.key});

  @override
  State<PaidBooking> createState() => _PaidBookingState();
}

class _PaidBookingState extends State<PaidBooking> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingBloc()..add(GetBookingHistoryEvent()),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: BlocBuilder<BookingBloc, BookingState>(
                builder: (context, state) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (state is BookingFailed) {
                      showCustomSnackbar(context, state.error);
                    }
                  });
                  if (state is HistoryBookingSuccess) {
                    var completedHistory = state.data.dataHistory
                        .where((history) => history.status == 'paid')
                        .toList();

                    return completedHistory.isNotEmpty
                        ? ListView(
                            children: completedHistory
                                .map(
                                    (history) => CardBookingPaid(data: history))
                                .toList(),
                          )
                        : DefaultValue(
                            imageSvg: 'images/empty_history.svg',
                            text:
                                AppLocalizations.of(context)!.textNoBookingInfo,
                          );
                  }
                  return SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        4,
                        (_) => const ShimmerList(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: SizedBox(
          width: 48,
          height: 48,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NoMessages(),
                ),
              );
            },
            backgroundColor: AppColors.buttonColor,
            child: const Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  Icons.message,
                  color: AppColors.white,
                  size: 26,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
