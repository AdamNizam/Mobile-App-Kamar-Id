part of 'check_avaibility_hotel_bloc.dart';

sealed class CheckAvaibilityHotelState extends Equatable {
  const CheckAvaibilityHotelState();

  @override
  List<Object> get props => [];
}

final class CheckAvaibilityHotelInitial extends CheckAvaibilityHotelState {}

final class CheckAvaibilityLoading extends CheckAvaibilityHotelState {}

class CheckAvaibilitySuccess extends CheckAvaibilityHotelState {
  final ResultCheckAvaibility data;

  const CheckAvaibilitySuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class ChekAvaibilityFailed extends CheckAvaibilityHotelState {
  final String error;

  const ChekAvaibilityFailed(this.error);

  @override
  List<Object> get props => [error];
}
