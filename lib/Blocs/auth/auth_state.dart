part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final LoginResponseResult resultLog;

  const AuthSuccess(this.resultLog);
  @override
  List<Object> get props => [resultLog];
}

final class AuthFailed extends AuthState {
  final String error;
  const AuthFailed(this.error);

  @override
  List<Object> get props => [error];
}
