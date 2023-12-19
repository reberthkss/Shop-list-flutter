import 'dart:convert';

import 'package:app/home/base/model/department_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class DepartmentService {
  Future<List<DepartmentModel>> getDepartmentList();
}

@Injectable(as: DepartmentService)
class DepartmentServiceImpl implements DepartmentService {
  const DepartmentServiceImpl(this.dio);

  final Dio dio;

  @override
  Future<List<DepartmentModel>> getDepartmentList() async {
    final response = await dio.request("/department/list");
    if (response.statusCode == 200) {
      final List<dynamic> departmentListJson = jsonDecode(response.data) ?? [];
      
      return departmentListJson
          .where((department) => department != null)
          .map(
            (department) => DepartmentModel.fromJson(department),
          )
          .toList();
    }
    throw Exception("status code: ${response.statusCode}");
  }
}
