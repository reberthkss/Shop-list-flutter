import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../di/injection.dart';
import '../../../route/route_list.dart';
import '../../base/model/product_model.dart';
import '../../products/widgets/product_horizontal_card_widget.dart';
import 'market_list_detail_model.dart';

class MarketListDetailEditWidget extends StatelessWidget {
  MarketListDetailEditWidget({
    required this.model,
    required this.marketListId,
    required this.onDelete,
    RouteList? routeList,
    super.key,
  }) : _routeList = routeList ?? getIt.get();

  final MarketListDetailModel model;
  final RouteList _routeList;
  final String marketListId;
  final Function(Product product) onDelete;

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
                child: Row(
                  children: [
                    Expanded(
                      child: ProductHorizontalCard(
                        product: product,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        onDelete(product);
                      },
                      icon: const Icon(
                        Icons.close,
                      ),
                    )
                  ],
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
