part of 'get_contact_bloc.dart';

sealed class GetContactEvent extends Equatable {
  const GetContactEvent();

  @override
  List<Object> get props => [];
}

class FetchContactEvent extends GetContactEvent {}
