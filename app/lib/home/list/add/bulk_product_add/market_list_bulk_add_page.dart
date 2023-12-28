import 'package:flutter/material.dart';

import '../../../../di/injection.dart';
import '../../../../route/route_list.dart';
import '../../../products/widgets/products_by_department_widget.dart';

class MarketListBulkAddPage extends StatelessWidget {
  MarketListBulkAddPage({RouteList? routeList, super.key})
      : _routeList = routeList ?? getIt.get();

  final RouteList _routeList;
  final _controller = DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ProductsByDepartmentWidget(
            onTapProduct: (productId) {},
          ),
          DraggableScrollableSheet(
            controller: _controller,
            initialChildSize: 0.1,
            maxChildSize: 1,
            minChildSize: 0.1,
            expand: true,
            snap: true,
            snapSizes: [0.5],
            builder: (BuildContext context, ScrollController scrollController) {
              return DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    const SliverToBoxAdapter(
                      child: Text('Title'),
                    ),
                    SliverList.list(
                      children: const [
                        Text('Content'),
                      ],
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
