import 'package:flutter/material.dart';

import '../../../route/route_list.dart';
import '../../base/model/product_model.dart';
import '../../products/widgets/product_horizontal_card_widget.dart';
import 'market_list_detail_model.dart';

class MarketListDetailEditWidget extends StatelessWidget {
  const MarketListDetailEditWidget({
    required this.model,
    required this.removedList,
    required this.marketListId,
    required this.onDelete,
    RouteList? routeList,
    super.key,
  });

  final MarketListDetailModel model;
  final List<Product> removedList;
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
              final productOccurence = model.products[index];
              bool isRemoved = false;

              try {
                removedList.firstWhere(
                  (removedProduct) =>
                      removedProduct.id == productOccurence.product.id,
                );
                isRemoved = true;
              } catch (_) {
                // do nothing
              }

              return Row(
                children: [
                  Text(
                    productOccurence.occurences.toString(),
                  ),
                  Expanded(
                    child: ProductHorizontalCard(
                      product: productOccurence.product,
                      style: isRemoved
                          ? ProductHorizontalCardStyle.removed
                          : ProductHorizontalCardStyle.normal,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      onDelete(productOccurence.product);
                    },
                    icon: const Icon(
                      Icons.close,
                    ),
                  )
                ],
              );
            },
          ),
        ),
        Row(
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
        )
      ],
    );
  }
}
