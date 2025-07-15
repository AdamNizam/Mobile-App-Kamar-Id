import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Data/Models/MidtransModel/request_midtrans.dart';
import 'package:hotelbookingapp/Data/Models/MidtransModel/result_midtrans.dart';
import 'package:hotelbookingapp/Data/Api/Services/midtrans_payment_service.dart';

part 'midtrans_payment_event.dart';
part 'midtrans_payment_state.dart';

class MidtransPaymentBloc
    extends Bloc<MidtransPaymentEvent, MidtransPaymentState> {
  MidtransPaymentBloc() : super(MidtransPaymentInitial()) {
    on<PayWithMidtrans>((event, emit) async {
      try {
        emit(MidtransPaymentLoading());

        final data =
            await PaymentMidtransService().payWithMidtrans(event.dataRequest);

        emit(MidtransPaymentSucsess(data));
      } catch (error) {
        print('Payment Failed: $error');
        emit(MidtransPaymentFailed(error.toString()));
      }
    });
  }
}
