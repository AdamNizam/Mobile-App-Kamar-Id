import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Models/booking_history_model.dart';
import 'package:hotelbookingapp/Services/booking_service.dart';

part 'booking_history_event.dart';
part 'booking_history_state.dart';

class BookingHistoryBloc
    extends Bloc<BookingHistoryEvent, BookingHistoryState> {
  BookingHistoryBloc() : super(BookingHistoryInitial()) {
    on<BookingHistoryEvent>((event, emit) async {
      if (event is GetBookingHistory) {
        try {
          emit(BookingHistoryLoading());

          final bookingHistory = await BookingService().getBookingHistory();

          emit(BookingHistorySuccess(bookingHistory));
        } catch (e) {
          emit(const BookingHistoryFailed('Terjadi Kesalahan'));
          print('pesan kesalahannya: $e');
        }
      }
    });
  }
}
