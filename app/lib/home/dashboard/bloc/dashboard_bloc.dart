import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(Idle());
}

abstract class DashboardEvent {}

abstract class DashboardState {}

class Idle extends DashboardState {}
