part of 'get_contact_bloc.dart';

sealed class GetContactState extends Equatable {
  const GetContactState();

  @override
  List<Object> get props => [];
}

final class GetContactInitial extends GetContactState {}

final class GetContactLoading extends GetContactState {}

final class GetContactFailed extends GetContactState {
  final String error;

  const GetContactFailed(this.error);

  @override
  List<Object> get props => [error];
}

final class GetContactSuccess extends GetContactState {
  final ResultGetContacts data;

  const GetContactSuccess(this.data);

  @override
  List<Object> get props => [data];
}
