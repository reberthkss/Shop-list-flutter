import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DepartmentSelectorBloc
    extends Bloc<DepartmentSelectorBlocEvent, DepartmentSelectorBlocState> {
  DepartmentSelectorBloc() : super(None()) {
    on<SetDepartmentSelected>((event, emit) {
      emit(
        SelectedDepartmentId(selectedDepartmentId: event.selectedDepartmentId),
      );
    });
  }
}

abstract class DepartmentSelectorBlocEvent {}

abstract class DepartmentSelectorBlocState {}

class SetDepartmentSelected extends DepartmentSelectorBlocEvent {
  SetDepartmentSelected({
    required this.selectedDepartmentId,
  });

  final String selectedDepartmentId;
}

class SelectedDepartmentId extends DepartmentSelectorBlocState {
  SelectedDepartmentId({
    required this.selectedDepartmentId,
  });

  final String selectedDepartmentId;
}

class None extends DepartmentSelectorBlocState {
  None();
}
