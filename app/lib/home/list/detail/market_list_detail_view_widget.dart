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
              final productOccurence = model.products[index];
              return InkWell(
                child: Row(
                  children: [
                    Text(
                      productOccurence.occurences.toString(),
                    ),
                    Expanded(
                      child: ProductHorizontalCard(
                        product: productOccurence.product,
                      ),
                    )
                  ],
                ),
                onTap: () {
                  context.push(
                    _routeList.productDetail.getDetail(
                      productOccurence.product.id,
                    ),
                  );
                },
              );
            },
          ),
        ),
        Row(
          children: [
            Text(
              "TOTAL: ",
            ),
            Expanded(
              child: Text(
                model.total,
              ),
            )
          ],
        )
      ],
    );
  }
}
