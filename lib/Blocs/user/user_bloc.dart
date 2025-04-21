import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Models/UserModel/form_update_password.dart';
import 'package:hotelbookingapp/Models/UserModel/request_user_update.dart';
import 'package:hotelbookingapp/Models/UserModel/result_update_password.dart';
import 'package:hotelbookingapp/Models/UserModel/result_user_update.dart';
import 'package:hotelbookingapp/Models/UserModel/user_model.dart';
import 'package:hotelbookingapp/Services/user_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is GetUserProfile) {
        try {
          emit(UserLoading());

          final data = await UserService().getUserProfile();

          emit(UserSuccess(data));
        } catch (error) {
          print('pesan kesalahan: $error');
          emit(const UserFailed('Data not found'));
        }
      }

      if (event is PostUserUpdateEvent) {
        try {
          emit(UserLoading());

          final data = await UserService().updatePorfile(event.dataRequest);

          emit(UpdateUserSuccess(data));
        } catch (error) {
          print('Error Update User: $error');
          emit(UserFailed(error.toString()));
        }
      }
    });
  }
}
