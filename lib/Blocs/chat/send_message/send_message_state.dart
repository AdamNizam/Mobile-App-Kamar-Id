part of 'send_message_bloc.dart';

sealed class SendMessageState extends Equatable {
  const SendMessageState();
  
  @override
  List<Object> get props => [];
}

final class SendMessageInitial extends SendMessageState {}
