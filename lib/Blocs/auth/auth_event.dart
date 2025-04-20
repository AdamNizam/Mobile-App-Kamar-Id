part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLogout extends AuthEvent {}

class AuthLogin extends AuthEvent {
  final FormLoginModel data;

  const AuthLogin(this.data);

  @override
  List<Object> get props => [data];
}

class AuthGetCurrentUser extends AuthEvent {}

class AuthRegister extends AuthEvent {
  final FormRegisterModel data;

  const AuthRegister(this.data);

  @override
  List<Object> get props => [data];
}
