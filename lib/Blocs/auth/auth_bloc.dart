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
        if (event is AuthGetCurrentUser) {
          try {
            emit(AuthLoading());

            final token = await AuthService().getToken();
            final isValid = await AuthService().isTokenValid();

            if (token.isNotEmpty && isValid) {
              emit(AuthSuccess(LoginResponse(token: token)));
            } else {
              emit(const TokenExpired('Token expired'));
            }
          } catch (error) {
            print('Failed get token: $error');
            emit(const AuthFailed('Token expired'));
          }
        }

        if (event is AuthLoginEvent) {
          try {
            emit(AuthLoading());

            final data = await AuthService().login(event.data);

            emit(AuthSuccess(data));
          } catch (error) {
            print('Login failed: $error');
            emit(const AuthFailed('Login failed'));
          }
        }

        if (event is AuthFacebookEvent) {
          try {
            emit(AuthLoading());

            final token = await AuthService().logFacebook(event.accessToken);

            emit(AuthSuccess(token));
          } catch (error) {
            print('failed login with facebook: $error');
            emit(const AuthFailed('Failed log with facebook'));
          }
        }

        if (event is AuthGoogleEvent) {
          try {
            emit(AuthLoading());

            final token = await AuthService().logGoogle(event.accessToken);

            emit(AuthSuccess(token));
          } catch (error) {
            print('failed login with google: $error');
            emit(const AuthFailed('Failed log with google'));
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

        if (event is AuthLogout) {
          emit(AuthLoading());

          await AuthService().logout();

          emit(AuthInitial());
        }
      },
    );
  }
}
