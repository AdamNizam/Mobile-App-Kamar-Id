import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Data/Api/booking_service.dart';
import 'package:hotelbookingapp/Data/Models/BookingModel/history_booking.model.dart';
import 'package:hotelbookingapp/Data/Models/BookingModel/request_add_to_chart.dart';
import 'package:hotelbookingapp/Data/Models/BookingModel/result_add_to_chart.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingInitial()) {
    on<BookingEvent>((event, emit) async {
      if (event is AddToCartEvent) {
        try {
          emit(BookingLoading());

          final data = await BookingService().addToChart(event.dataRequest);

          emit(BookingSuccess(data));
        } catch (error) {
          print('Error add top cart: $error');
          emit(BookingFailed(error.toString()));
        }
      }
      if (event is GetBookingHistoryEvent) {
        try {
          emit(BookingLoading());

          final data = await BookingService().getHistoryBooking();

          emit(HistoryBookingSuccess(data));
        } catch (error) {
          print('Get Booking History Error $error');
          emit(const BookingFailed('Failed get Booking History'));
        }
      }
    });
  }
}
