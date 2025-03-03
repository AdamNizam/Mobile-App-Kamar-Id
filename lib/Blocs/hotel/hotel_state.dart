part of 'hotel_bloc.dart';

sealed class HotelState extends Equatable {
  const HotelState();

  @override
  List<Object> get props => [];
}

final class HotelInitial extends HotelState {}

final class HotelLoading extends HotelState {}

class HotelSuccess extends HotelState {
  final List<HotelAllModel> hotels;

  const HotelSuccess(this.hotels);

  @override
  List<Object> get props => [hotels];
}

final class HotelFailed extends HotelState {
  final String error;

  const HotelFailed(this.error);

  @override
  List<Object> get props => [error];
}
