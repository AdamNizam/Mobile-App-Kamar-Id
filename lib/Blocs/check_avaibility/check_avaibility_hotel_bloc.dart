import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:hotelbookingapp/Data/Api/hotel_service.dart';
import 'package:hotelbookingapp/Data/Models/HotelModel/request_check_avaibility.dart';
import 'package:hotelbookingapp/Data/Models/HotelModel/result_check_avaibility.dart';

part 'check_avaibility_hotel_event.dart';
part 'check_avaibility_hotel_state.dart';

class CheckAvaibilityHotelBloc
    extends Bloc<CheckAvaibilityHotelEvent, CheckAvaibilityHotelState> {
  CheckAvaibilityHotelBloc() : super(CheckAvaibilityHotelInitial()) {
    on<CheckAvaibilityHotelEvent>((event, emit) async {
      if (event is PostCheckAvailabilityEvent) {
        try {
          emit(CheckAvaibilityLoading());

          emit(
            CheckAvaibilitySuccess(
              await HotelService().checkAvaibility(event.dataRequest),
            ),
          );
        } catch (error) {
          debugPrint('Failed Check Avaibility : $error');
          emit(ChekAvaibilityFailed(error.toString()));
        }
      }
    });
  }
}
