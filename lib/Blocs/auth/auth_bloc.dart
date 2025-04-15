import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Models/ResponseResultModel/result_login.dart';
import 'package:hotelbookingapp/Models/ResponseResultModel/result_register.dart';
import 'package:hotelbookingapp/Models/UserModel/sign_in_form_model.dart';
import 'package:hotelbookingapp/Models/UserModel/sign_up_form_model.dart';
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
          } catch (error) {
            // print('errorrror login : $error');
            emit(const AuthFailed('Login Failed'));
          }
        }

        if (event is AuthRegister) {
          try {
            emit(AuthLoading());

            final userReg = await AuthService().register(event.data);

            emit(AuthRegSuccess(userReg));
          } catch (error) {
            // print('error register : ${error}');
            emit(const AuthFailed('Register failed'));
          }
        }

        if (event is AuthGetCurrentUser) {
          try {
            final SignInFormModel? data =
                await AuthService().getCredentialFromLocal();

            if (data == null) return;

            emit(AuthLoading());

            final LoginResponse user = await AuthService().login(data);

            emit(AuthSuccess(user));
          } catch (error) {
            // print('error get current user : $error');
            emit(const AuthFailed('Authentication Failed'));
          }
        }

        if (event is AuthLogout) {
          try {
            emit(AuthLoading());

            await AuthService().logout();

            emit(AuthInitial());
          } catch (error) {
            // print('error logout : $error');
            emit(const AuthFailed('Logout Failed'));
          }
        }
      },
    );
  }
}
