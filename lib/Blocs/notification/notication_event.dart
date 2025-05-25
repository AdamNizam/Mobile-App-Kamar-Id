part of 'notication_bloc.dart';

sealed class NoticationEvent extends Equatable {
  const NoticationEvent();

  @override
  List<Object> get props => [];
}

class GetAllMessage extends NoticationEvent {
  final String type;

  const GetAllMessage(this.type);
}

class ReadMessage extends NoticationEvent {
  final List<int> idNotif;

  const ReadMessage(this.idNotif);
}
