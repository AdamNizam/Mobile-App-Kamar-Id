part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthGetCurrentUser extends AuthEvent {}

class AuthLogout extends AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final FormLoginModel data;

  const AuthLoginEvent(this.data);

  @override
  List<Object> get props => [data];
}

class AuthFacebookEvent extends AuthEvent {
  final String accessToken;

  const AuthFacebookEvent(this.accessToken);

  @override
  List<Object> get props => [accessToken];
}

class AuthGoogleEvent extends AuthEvent {
  final String accessToken;

  const AuthGoogleEvent(this.accessToken);

  @override
  List<Object> get props => [accessToken];
}

class AuthRegister extends AuthEvent {
  final FormRegisterModel data;

  const AuthRegister(this.data);

  @override
  List<Object> get props => [data];
}
