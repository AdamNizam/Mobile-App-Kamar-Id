import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Models/AuthModel/form_login_model.dart';
import 'package:hotelbookingapp/Models/AuthModel/form_register_model.dart';
import 'package:hotelbookingapp/Models/AuthModel/result_login.dart';
import 'package:hotelbookingapp/Models/AuthModel/result_register.dart';
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

            print('userLog: $userLog');

            emit(AuthSuccess(userLog));
          } catch (error) {
            print('Login failed: $error');
            emit(const AuthFailed('Login failed'));
          }
        }

        if (event is AuthRegister) {
          try {
            emit(AuthLoading());

            final userReg = await AuthService().register(event.data);

            emit(AuthRegSuccess(userReg));
          } catch (error) {
            print('Register failed: $error');
            emit(const AuthFailed('Register failed'));
          }
        }

        if (event is AuthGetCurrentUser) {
          try {
            final FormLoginModel? data =
                await AuthService().getCredentialFromLocal();

            if (data == null) return;

            emit(AuthLoading());

            final LoginResponse user = await AuthService().login(data);

            emit(AuthSuccess(user));
          } catch (error) {
            print('Failed get token: $error');
            emit(const AuthFailed('Token Failed'));
          }
        }

        if (event is AuthLogout) {
          try {
            emit(AuthLoading());

            await AuthService().logout();

            emit(AuthInitial());
          } catch (error) {
            print('Logout failed: $error');
            emit(const AuthFailed('Logout Failed'));
          }
        }
      },
    );
  }
}
