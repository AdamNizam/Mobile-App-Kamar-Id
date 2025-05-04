import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/booking/booking_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/Shimmers/shimmer_list.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomCard/card_booking_paid.dart';
import 'package:hotelbookingapp/Screens/Status/Default_screen_booking.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';

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
