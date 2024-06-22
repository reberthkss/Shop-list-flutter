import 'package:shop_list/home/base/model/department_model.dart';
import 'package:injectable/injectable.dart';

import 'department_service.dart';

abstract class DepartmentRepository {
  Future<List<DepartmentModel>> getDepartmentList();
}

@Injectable(as: DepartmentRepository)
class DepartmentRepositoryImpl implements DepartmentRepository {
  const DepartmentRepositoryImpl(this.service);

  final DepartmentService service;

  @override
  Future<List<DepartmentModel>> getDepartmentList() =>
      service.getDepartmentList();
}
