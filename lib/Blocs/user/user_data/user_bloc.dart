import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Data/Api/user_service.dart';
import 'package:hotelbookingapp/Data/Models/UserModel/user_model.dart';

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
          print('erros user: $error');
          emit(const UserFailed('Data not found'));
        }
      }
    });
  }
}
