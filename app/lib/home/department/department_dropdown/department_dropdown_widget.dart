import 'package:shop_list/home/department/department_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'department_dropdown_widget.result.dart';

class DepartmentDropdownWidget extends StatelessWidget {
  const DepartmentDropdownWidget({
    required this.onRequestDepartmentProduct,
    super.key,
  });

  final Function(int departmentId) onRequestDepartmentProduct;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepartmentBloc, DepartmentBlocState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case LoadingDepartments:
            {
              return const CircularProgressIndicator();
            }
          case Departments:
            {
              state as Departments;
              return DepartmentDropDownResult(
                items: state.departmentModeList,
                onSelect: onRequestDepartmentProduct,
              );
            }
          default:
            {
              return const SizedBox.shrink();
            }
        }
      },
    );
  }
}
