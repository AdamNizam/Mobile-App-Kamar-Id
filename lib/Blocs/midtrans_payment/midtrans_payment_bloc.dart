import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Services/midtrans_payment_service.dart';

part 'midtrans_payment_event.dart';
part 'midtrans_payment_state.dart';

class MidtransPaymentBloc
    extends Bloc<MidtransPaymentEvent, MidtransPaymentState> {
  MidtransPaymentBloc() : super(MidtransPaymentInitial()) {
    on<PayNowPressed>((event, emit) async {
      emit(MidtransPaymentLoading());

      try {
        final result = await PaymentService().payNow(
          totalPrice: event.totalPrice,
          selectedType: event.selectedType,
          selectedBank: event.selectedBank,
        );
        emit(MidtransPaymentSucsess(result));
      } catch (error) {
        emit(MidtransPaymentFailed(error.toString()));
      }
    });
  }
}
