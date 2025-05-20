import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/booking/booking_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomCard/card_booking_completed.dart';
import 'package:hotelbookingapp/CustomWidgets/Shimmers/shimmer_list.dart';
import 'package:hotelbookingapp/CustomWidgets/default_value.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';

class CompletedBooking extends StatefulWidget {
  const CompletedBooking({super.key});

  @override
  State<CompletedBooking> createState() => _CompletedBookingState();
}

class _CompletedBookingState extends State<CompletedBooking> {
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
                        .where((history) => history.status == 'completed')
                        .toList();

                    return completedHistory.isNotEmpty
                        ? ListView(
                            children: completedHistory
                                .map((history) =>
                                    CardBookingCompleted(data: history))
                                .toList(),
                          )
                        : const DefaultValue(
                            imageSvg: 'images/empty_history.svg',
                            text: "There is not booking info.",
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
      ),
    );
  }
}
