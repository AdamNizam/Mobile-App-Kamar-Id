import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotelbookingapp/Models/CheckoutModel/chekout_model.dart';
import 'package:hotelbookingapp/Models/ResponseResultModel/result_chekout.dart';
import 'package:hotelbookingapp/Services/checkout_service.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutInitial()) {
    on<CheckoutEvent>((event, emit) async {
      if (event is CheckoutSubmitEvent) {
        try {
          emit(CheckoutLoading());

          final data = await ChekoutService().doToChekout(event.checkoutModel);

          emit(CheckoutSuccess(data));
        } catch (error) {
          print('checkout error: $error');
          emit(CheckoutFailed(error.toString()));
        }
      }
    });
  }
}
