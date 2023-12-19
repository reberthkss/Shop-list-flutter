import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(Idle());
}

abstract class SettingsEvent {}

abstract class SettingsState {}

class Idle extends SettingsState {}
