import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotelbookingapp/Data/Api/auth_service.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc() : super(ForgetPasswordInitial()) {
    on<ForgetPasswordEvent>((event, emit) async {
      if (event is PostEmailForgetPassword) {
        try {
          emit(ForgetPasswordLoading());

          final data = await AuthService().forgetPassword(event.emailRequest);

          emit(ForgetPasswordSuccess(data));
        } catch (error) {
          print('forget password error: $error');
          emit(ForgetPasswordFailed(error.toString()));
        }
      }
    });
  }
}
