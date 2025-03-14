import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotelbookingapp/Models/booking_history_model.dart';
import 'package:hotelbookingapp/Services/booking_service.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingInitial()) {
    on<BookingEvent>((event, emit) async {
      if (event is GetBookingHistory) {
        try {
          emit(BookingHistoryLoading());

          final bookingHistory = await BookingService().getBookingHistory();

          emit(BookingHistorySuccess(bookingHistory));
        } catch (e) {
          emit(const BookingHistoryFailed('Terjadi Kesalahan'));
          print('pesan booking kesalahannya: $e');
        }
      }
    });
  }
}
