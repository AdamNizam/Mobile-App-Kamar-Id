import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Services/midtrans_payment_service.dart';

part 'midtrans_payment_event.dart';
part 'midtrans_payment_state.dart';

class MidtransPaymentBloc
    extends Bloc<MidtransPaymentEvent, MidtransPaymentState> {
  MidtransPaymentBloc() : super(MidtransPaymentInitial()) {
    on<PayNowPressed>((event, emit) async {
      try {
        emit(MidtransPaymentLoading());

        final result = await PaymentService().payNow(
          totalPrice: event.totalPrice,
          selectedType: event.selectedType,
          selectedBank: event.selectedBank,
          customerEmail: "@harusEmailPenguna@gmail.com",
        );

        emit(MidtransPaymentSucsess(result));
      } catch (error) {
        print('Error: $error');
        emit(const MidtransPaymentFailed('Payment Invalid!'));
      }
    });
  }
}
