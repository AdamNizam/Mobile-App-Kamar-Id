import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotelbookingapp/Models/HotelModel/request_check_avaibility.dart';
import 'package:hotelbookingapp/Models/HotelModel/result_check_avaibility.dart';
import 'package:hotelbookingapp/Services/hotel_service.dart';

part 'check_avaibility_hotel_event.dart';
part 'check_avaibility_hotel_state.dart';

class CheckAvaibilityHotelBloc
    extends Bloc<CheckAvaibilityHotelEvent, CheckAvaibilityHotelState> {
  CheckAvaibilityHotelBloc() : super(CheckAvaibilityHotelInitial()) {
    on<CheckAvaibilityHotelEvent>((event, emit) async {
      if (event is PostCheckAvailabilityEvent) {
        try {
          emit(CheckAvaibilityLoading());

          final data = await HotelService().checkAvaibilityHotel(
            event.dataRequest,
          );

          emit(CheckAvaibilitySuccess(data));
        } catch (error) {
          print('Check Avaibility Error $error');
          emit(const ChekAvaibilityFailed('Checking failed!'));
        }
      }
    });
  }
}
