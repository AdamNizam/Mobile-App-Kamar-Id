import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/booking/booking_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/Shimmers/shimmer_list.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomCard/card_booking_cancelled.dart';
import 'package:hotelbookingapp/Screens/Status/Default_screen_booking.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';

class CancelledBooking extends StatelessWidget {
  const CancelledBooking({super.key});

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
                    var cancelledHistory = state.data.dataHistory
                        .where((history) => history.status == 'cancelled')
                        .toList();

                    return cancelledHistory.isNotEmpty
                        ? ListView(
                            children: cancelledHistory
                                .map((history) =>
                                    CardBookingCancelled(data: history))
                                .toList(),
                          )
                        : const NoDataBooking();
                  }
                  return Column(
                    children: List.generate(4, (_) => const ShimmerList()),
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
