import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Models/HotelModel/hotel_all_model.dart';
import 'package:hotelbookingapp/Models/HotelModel/hotel_detail_model.dart';
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

            final data = await HotelService().gethAllHotels();

            emit(HotelSuccess(data));
          } catch (error) {
            // print('Get Data Hotel Error : $error');
            emit(const HotelFailed('Get data failed!'));
          }
        }

        if (event is GetDetailHotel) {
          try {
            emit(HotelDetailLoading());

            final data = await HotelService().getDetailHotel(event.slug);

            emit(GetAllHotelDetailSuccess(data));
          } catch (error) {
            // print('Get Data Detail Hotel: $error');
            emit(const HotelFailed('Hotel not found'));
          }
        }
      },
    );
  }
}
