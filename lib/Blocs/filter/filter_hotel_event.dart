part of 'filter_hotel_bloc.dart';

sealed class FilterHotelEvent extends Equatable {
  const FilterHotelEvent();

  @override
  List<Object> get props => [];
}

class PostFilterHotel extends FilterHotelEvent {
  final RequestFilterModel dataRequest;

  const PostFilterHotel(this.dataRequest);

  @override
  List<Object> get props => [dataRequest];
}
