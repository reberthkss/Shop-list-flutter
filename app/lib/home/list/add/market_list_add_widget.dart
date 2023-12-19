import 'package:app/home/base/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../base/model/market_list_model.dart';
import '../../products/widgets/product_horizontal_card_widget.dart';
import '../widget/horizontal_card/market_list_horizontal_item_widget.dart';

class MarketListAddWidget extends StatelessWidget {
  const MarketListAddWidget({
    required this.product,
    required this.marketList,
    super.key,
  });

  final Product? product;
  final List<MarketListModel> marketList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          if (product != null) ...[
            ProductHorizontalCard(
              product: product!,
            )
          ],
          ListView.builder(
            shrinkWrap: true,
            itemCount: marketList.length,
            itemBuilder: (ctx, index) {
              final item = marketList[index];
              return MarketListHorizontalItemWidget(
                marketListModel: item,
                onTap: (id) {},
              );
            },
          )
        ],
      ),
    );
  }
}
