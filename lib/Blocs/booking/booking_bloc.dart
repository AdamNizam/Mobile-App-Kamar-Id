import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Models/BookingModel/add_to_chart_model.dart';
import 'package:hotelbookingapp/Models/ResponseResultModel/result_add_to_cart.dart';
import 'package:hotelbookingapp/Services/booking_service.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingInitial()) {
    on<BookingEvent>((event, emit) async {
      if (event is AddToCartEvent) {
        try {
          emit(BookingLoading());

          final data = await BookingService().addToChart(event.cartModel);

          emit(BookingSuccess(data));
        } catch (error) {
          print('Error add tp cart: $error');
          emit(const BookingFailed('Failed to add to cart'));
        }
      }
    });
  }
}
