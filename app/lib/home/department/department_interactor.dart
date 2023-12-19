import 'package:injectable/injectable.dart';

import '../base/model/department_model.dart';
import 'department_repository.dart';

abstract class DepartmentInteractor {
  Future<List<DepartmentModel>> getDepartmentList();
}


@Injectable(as: DepartmentInteractor)
class DepartmentInteractorImpl implements DepartmentInteractor {
  const DepartmentInteractorImpl(
    this.repository,
  );

  final DepartmentRepository repository;
  @override
  Future<List<DepartmentModel>> getDepartmentList() {
    return repository.getDepartmentList();
  }

}