import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckLoginBloc extends Bloc<CheckLoginEvent, CheckLoginState> {
  CheckLoginBloc(): super(DoCheck());

}


abstract class CheckLoginEvent {}
abstract class CheckLoginState {}

class DoCheck extends CheckLoginState {}