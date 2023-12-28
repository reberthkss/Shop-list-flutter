import 'package:flutter/material.dart';

import '../../../base/model/market_list_model.dart';

class ListCardWidget extends StatelessWidget {
  const ListCardWidget({required this.model, required this.onTap, super.key});

  final MarketListModel model;
  final Function(String id) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(model.id);
      },
      child: Card(
        child: SizedBox(
          height: 50,
          child: Column(
            children: [Text(model.name)],
          ),
        ),
      ),
    );
  }
}
