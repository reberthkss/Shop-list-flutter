import 'package:app/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../route/route_list.dart';
import '../../products/widgets/product_horizontal_card_widget.dart';
import 'market_list_detail_model.dart';

class MarketListDetailViewWidget extends StatelessWidget {
  MarketListDetailViewWidget({
    required this.model,
    required this.marketListId,
    RouteList? routeList,
    super.key,
  }) : _routeList = routeList ?? getIt.get();

  final MarketListDetailModel model;
  final RouteList _routeList;
  final String marketListId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: model.products.length,
            itemBuilder: (ctx, index) {
              final product = model.products[index];
              return Container(
                padding: const EdgeInsets.all(16),
                child: ProductHorizontalCard(
                  product: product,
                ),
              );
            },
          ),
        ),
        Container(
          child: Row(
            children: [
              const Expanded(
                child: Text("TOTAL"),
              ),
              Expanded(
                child: Text(
                  model.total,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
