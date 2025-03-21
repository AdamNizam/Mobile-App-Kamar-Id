part of 'hotel_bloc.dart';

sealed class HotelState extends Equatable {
  const HotelState();

  @override
  List<Object> get props => [];
}

final class HotelInitial extends HotelState {}

final class HotelLoading extends HotelState {}

final class HotelDetailLoading extends HotelState {}

final class HotelFailed extends HotelState {
  final String error;

  const HotelFailed(this.error);

  @override
  List<Object> get props => [error];
}

class HotelSuccess extends HotelState {
  final List<HotelAllModel> data;

  const HotelSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class GetAllHotelDetailSuccess extends HotelState {
  final HotelDetailModel data;

  const GetAllHotelDetailSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class CheckAvaibilitySuccess extends HotelState {
  final ResultCheckAvaibility data;

  const CheckAvaibilitySuccess(this.data);

  @override
  List<Object> get props => [data];
}
