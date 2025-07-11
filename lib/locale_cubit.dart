import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('id', 'ID'));

  void switchToEnglish() => emit(const Locale('en', 'US'));

  void switchToIndonesian() => emit(const Locale('id', 'ID'));
}
