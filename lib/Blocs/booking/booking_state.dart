part of 'booking_bloc.dart';

sealed class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

final class BookingInitial extends BookingState {}

final class BookingLoading extends BookingState {}

final class BookingSuccess extends BookingState {
  final ResponseResultAddToChart data;

  const BookingSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class BookingFailed extends BookingState {
  final String error;

  const BookingFailed(this.error);

  @override
  List<Object> get props => [error];
}
