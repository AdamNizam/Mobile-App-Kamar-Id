import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:hotelbookingapp/Models/CheckoutModel/request_chekout.dart';
import 'package:hotelbookingapp/Models/CheckoutModel/result_chekout.dart';
import 'package:hotelbookingapp/Services/booking_service.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutInitial()) {
    on<CheckoutEvent>((event, emit) async {
      if (event is CheckoutSubmitEvent) {
        try {
          emit(CheckoutLoading());

          final data = await BookingService().doToChekout(event.dataRequest);

          emit(CheckoutSuccess(data));
        } catch (error) {
          debugPrint('checkout error: $error');
          emit(CheckoutFailed(error.toString()));
        }
      }
    });
  }
}
