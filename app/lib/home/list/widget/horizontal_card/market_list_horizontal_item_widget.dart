import 'package:flutter/material.dart';

import '../../../base/model/market_list_model.dart';

class MarketListHorizontalItemWidget extends StatelessWidget {
  const MarketListHorizontalItemWidget({
    required this.marketListModel,
    required this.onTap,
  });

  final MarketListModel marketListModel;
  final Function(String id) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(marketListModel.id);
      },
      child: Card(
        child: SizedBox(
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(marketListModel.name),
            ],
          ),
        ),
      ),
    );
  }
}
