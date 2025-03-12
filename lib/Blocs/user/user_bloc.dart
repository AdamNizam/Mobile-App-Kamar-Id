import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotelbookingapp/Models/user_model.dart';
import 'package:hotelbookingapp/Services/user_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is GetUserProfile) {
        try {
          emit(UserLoading());

          final userProfile = await UserService().getUserProfile();

          emit(UserSuccess(userProfile));
        } catch (e) {
          emit(const UserFailed('Terjadi Kesalahan'));
          print('pesan kesalahan: $e');
        }
      }
    });
  }
}
