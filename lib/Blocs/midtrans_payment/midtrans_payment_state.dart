part of 'midtrans_payment_bloc.dart';

sealed class MidtransPaymentState extends Equatable {
  const MidtransPaymentState();

  @override
  List<Object> get props => [];
}

final class MidtransPaymentInitial extends MidtransPaymentState {}

class MidtransPaymentLoading extends MidtransPaymentState {}

class MidtransPaymentSucsess extends MidtransPaymentState {
  final Map<String, dynamic> data;

  const MidtransPaymentSucsess(this.data);

  @override
  List<Object> get props => [data];
}

class MidtransPaymentFailed extends MidtransPaymentState {
  final String error;

  const MidtransPaymentFailed(this.error);

  @override
  List<Object> get props => [error];
}
