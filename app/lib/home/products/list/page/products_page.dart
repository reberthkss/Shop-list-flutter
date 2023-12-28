import 'package:app/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../route/route_list.dart';
import '../../widgets/products_by_department_widget.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final routeList = getIt.get<RouteList>();

    return ProductsByDepartmentWidget(
      onTapProduct: (productId) {
        context.go(
          routeList.productDetail.getDetail(
            productId,
          ),
        );
      },
    );
  }
}
