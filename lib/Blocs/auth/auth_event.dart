part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthGetCurrentUser extends AuthEvent {}

class AuthLogin extends AuthEvent {
  final FormLoginModel data;

  const AuthLogin(this.data);

  @override
  List<Object> get props => [data];
}

class AuthFacebook extends AuthEvent {
  final String accessToken;

  const AuthFacebook(this.accessToken);

  @override
  List<Object> get props => [accessToken];
}

class AuthGoogle extends AuthEvent {
  final String accessToken;

  const AuthGoogle(this.accessToken);

  @override
  List<Object> get props => [accessToken];
}

class AuthRegister extends AuthEvent {
  final FormRegisterModel data;

  const AuthRegister(this.data);

  @override
  List<Object> get props => [data];
}

class AuthLogout extends AuthEvent {}
