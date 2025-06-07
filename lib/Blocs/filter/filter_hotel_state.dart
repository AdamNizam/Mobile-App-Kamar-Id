part of 'filter_hotel_bloc.dart';

sealed class FilterHotelState extends Equatable {
  const FilterHotelState();

  @override
  List<Object> get props => [];
}

final class FilterHotelInitial extends FilterHotelState {}

final class FilterHotelLoading extends FilterHotelState {}

final class FilterHotelFailed extends FilterHotelState {
  final String error;

  const FilterHotelFailed(this.error);

  @override
  List<Object> get props => [error];
}

final class FilterHotelSuccess extends FilterHotelState {
  final List<ResultFilterModel> hotels;

  const FilterHotelSuccess(this.hotels);

  @override
  List<Object> get props => [hotels];
}
