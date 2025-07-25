import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hotelbookingapp/Blocs/booking/booking_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomCard/card_booking_processing.dart';
import 'package:hotelbookingapp/CustomWidgets/Shimmers/shimmer_list.dart';
import 'package:hotelbookingapp/CustomWidgets/default_value.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';

class ProcessingBooking extends StatefulWidget {
  const ProcessingBooking({super.key});

  @override
  State<ProcessingBooking> createState() => _ProcessingBookingState();
}

class _ProcessingBookingState extends State<ProcessingBooking> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingBloc()..add(GetBookingHistoryEvent()),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<BookingBloc, BookingState>(
                builder: (context, state) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (state is BookingFailed) {
                      showCustomSnackbar(context, state.error);
                    }
                  });

                  if (state is HistoryBookingSuccess) {
                    var processingHistory = state.data.dataHistory
                        .where((history) => history.status == 'processing')
                        .toList();

                    return processingHistory.isNotEmpty
                        ? ListView(
                            children: processingHistory
                                .map((history) =>
                                    CardBookingProcessing(data: history))
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
      ),
    );
  }
}
