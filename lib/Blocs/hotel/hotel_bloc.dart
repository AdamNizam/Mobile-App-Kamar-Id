import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  HotelBloc() : super(HotelInitial()) {
    on<HotelEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
