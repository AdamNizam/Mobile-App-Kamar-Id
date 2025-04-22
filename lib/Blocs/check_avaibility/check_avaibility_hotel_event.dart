part of 'check_avaibility_hotel_bloc.dart';

sealed class CheckAvaibilityHotelEvent extends Equatable {
  const CheckAvaibilityHotelEvent();

  @override
  List<Object> get props => [];
}

class PostCheckAvailabilityEvent extends CheckAvaibilityHotelEvent {
  final RequestCheckAvaibility dataRequest;

  const PostCheckAvailabilityEvent(this.dataRequest);

  @override
  List<Object> get props => [dataRequest];
}
