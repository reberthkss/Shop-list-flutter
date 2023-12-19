import 'package:equatable/equatable.dart';

class DepartmentModel extends Equatable {
  const DepartmentModel({
    required this.name,
    required this.id,
  });

  final String name;
  final int id;

  @override
  List<Object> get props => [
        name,
        id,
      ];

  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return DepartmentModel(
      id: json["id"] ?? -1,
      name: json["name"] ?? ""
    );
  }
}
