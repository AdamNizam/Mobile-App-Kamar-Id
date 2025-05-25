part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthRegSuccess extends AuthState {
  final RegisterResponse data;

  const AuthRegSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class AuthFailed extends AuthState {
  final String error;
  const AuthFailed(this.error);

  @override
  List<Object> get props => [error];
}

final class TokenExpired extends AuthState {
  final String text;

  const TokenExpired(this.text);

  @override
  List<Object> get props => [text];
}

final class AuthSuccess extends AuthState {
  final LoginResponse data;

  const AuthSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class AuthSuccessWithFacebook extends AuthState {
  final LoginResponse data;

  const AuthSuccessWithFacebook(this.data);

  @override
  List<Object> get props => [data];
}

final class AuthSuccessWithGoogle extends AuthState {
  final LoginResponse data;

  const AuthSuccessWithGoogle(this.data);

  @override
  List<Object> get props => [data];
}
