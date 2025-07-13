import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Models/ChatModel/result_get_contacts.dart';
import 'package:hotelbookingapp/Services/chat_service.dart';

part 'get_contact_event.dart';
part 'get_contact_state.dart';

class GetContactBloc extends Bloc<GetContactEvent, GetContactState> {
  GetContactBloc() : super(GetContactInitial()) {
    on<GetContactEvent>((event, emit) async {
      if (event is FetchContactEvent) {
        try {
          emit(GetContactLoading());
          final data = await ChatService().getContacts();
          emit(GetContactSuccess(data));
        } catch (error) {
          debugPrint('get contact failed $error');
          emit(GetContactFailed(error.toString()));
        }
      }
    });
  }
}
