import 'package:app/di/injection.dart';
import 'package:app/home/department/department_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/products_bloc.dart';
import '../../widgets/products_by_department_widget.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productsBloc = getIt.get<ProductsBloc>();
    final departmentBloc = getIt.get<DepartmentBloc>();

    return BlocProvider(
      create: (_) => departmentBloc,
      child: ProductsByDepartmentWidget(),
    );
  }
}
