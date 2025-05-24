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
  final String accesToken;

  const AuthFacebook(this.accesToken);

  @override
  List<Object> get props => [accesToken];
}

class AuthGoogle extends AuthEvent {
  final String accesToken;

  const AuthGoogle(this.accesToken);

  @override
  List<Object> get props => [accesToken];
}

class AuthRegister extends AuthEvent {
  final FormRegisterModel data;

  const AuthRegister(this.data);

  @override
  List<Object> get props => [data];
}

class AuthLogout extends AuthEvent {}
