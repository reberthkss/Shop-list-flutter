import 'package:app/home/department/department_interactor.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../base/model/department_model.dart';

@injectable
class DepartmentBloc extends Bloc<DepartmentBlocEvent, DepartmentBlocState> {
  final DepartmentInteractor interactor;

  DepartmentBloc(
    this.interactor,
  ) : super(
          Idle(),
        ) {
    on<LoadDepartments>(loadDepartments);
  }

  void loadDepartments(
    LoadDepartments event,
    Emitter<DepartmentBlocState> emit,
  ) async {
    try {
      emit(
        LoadingDepartments(),
      );
      final departmentList = await interactor.getDepartmentList();
      emit(
        Departments(departmentModeList: departmentList),
      );
    } catch (exception) {
      print(exception);
    }
  }
}

abstract class DepartmentBlocEvent extends Equatable {}

abstract class DepartmentBlocState extends Equatable {}

class LoadDepartments extends DepartmentBlocEvent {
  LoadDepartments();

  @override
  List<Object> get props => [];
}

class Departments extends DepartmentBlocState {
  Departments({
    required this.departmentModeList,
  });

  final List<DepartmentModel> departmentModeList;

  @override
  List<Object> get props => [
        departmentModeList,
      ];
}

class LoadingDepartments extends DepartmentBlocState {
  LoadingDepartments();

  @override
  List<Object> get props => [];
}

class Idle extends DepartmentBlocState {
  Idle();

  @override
  List<Object> get props => [];
}

class SetSelectedDepartment extends DepartmentBlocEvent {
  SetSelectedDepartment({
    required this.departmentId,
  });

  final String departmentId;

  @override
  List<Object> get props => [
        departmentId,
      ];
}

class DepartmentChange extends DepartmentBlocState {
  DepartmentChange({
    required this.departmentId,
  });

  final String departmentId;

  @override
  List<Object> get props => [
        departmentId,
      ];
}
