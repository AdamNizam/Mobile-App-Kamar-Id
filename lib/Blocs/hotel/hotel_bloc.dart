import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotelbookingapp/Models/hotel_all_model.dart';
import 'package:hotelbookingapp/Services/hotel_service.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  HotelBloc() : super(HotelInitial()) {
    on<HotelEvent>(
      (event, emit) async {
        if (event is GetAllHotels) {
          try {
            emit(HotelLoading());

            final hotels = await HotelService().gethAllHotels();

            if (hotels.isNotEmpty) {
              emit(HotelSuccess(hotels));
            } else {
              emit(const HotelFailed("Hotel is not available"));
            }
          } catch (e) {
            emit(HotelFailed(e.toString()));
          }
        }
      },
    );
  }
}
