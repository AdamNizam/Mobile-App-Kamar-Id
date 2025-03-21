import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotelbookingapp/Models/user/sign_in_form_model.dart';
import 'package:hotelbookingapp/Models/user/sign_up_form_model.dart';
import 'package:hotelbookingapp/Services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>(
      (event, emit) async {
        if (event is AuthLogin) {
          try {
            emit(AuthLoading());

            final userLog = await AuthService().login(event.data);

            emit(AuthSuccess(userLog));
          } catch (e) {
            emit(AuthFailed(e.toString()));
          }
        }

        if (event is AuthRegister) {
          try {
            emit(AuthLoading());

            final userReg = await AuthService().register(event.data);

            emit(AuthRegSuccess(userReg));
          } catch (e) {
            emit(const AuthFailed('register failed'));
            // print('error register : ${e}');
          }
        }

        if (event is AuthGetCurrentUser) {
          try {
            final SignInFormModel? data =
                await AuthService().getCredentialFromLocal();

            if (data == null) return;

            emit(AuthLoading());

            final LoginResponseResult user = await AuthService().login(data);

            emit(AuthSuccess(user));
          } catch (e) {
            emit(AuthFailed(e.toString()));
          }
        }

        if (event is AuthLogout) {
          try {
            emit(AuthLoading());

            await AuthService().logout();

            emit(AuthInitial());
          } catch (e) {
            emit(AuthFailed(e.toString()));
          }
        }
      },
    );
  }
}
