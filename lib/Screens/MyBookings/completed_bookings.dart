import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Blocs/booking/booking_bloc.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Screens/MyBookings/card_booking_completed.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Widgets/detailstext1.dart';
import '../../../Widgets/detailstext2.dart';

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
                    return state.data.dataHistory.isEmpty
                        ? Center(
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  'images/empty_history.svg',
                                  height: 150,
                                ),
                                Text(
                                  "Tidak ada riwayat booking.",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.cadetGray,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView(
                            children: state.data.dataHistory
                                .map((history) =>
                                    CardBookingCompleted(data: history))
                                .toList(),
                          );
                  }
                  return Column(
                    children: List.generate(4, (_) => shimmerListTile()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget shimmerListTile() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[200]!,
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

class ReusColumn extends StatelessWidget {
  final String text1, text2;
  const ReusColumn({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text2(text2: text1),
        const SizedBox(
          height: 2,
        ),
        Text1(
          text1: text2,
        )
      ],
    );
  }
}
