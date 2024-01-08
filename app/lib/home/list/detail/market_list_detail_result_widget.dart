import 'package:app/home/list/detail/market_list_detail_model.dart';
import 'package:app/home/list/detail/market_list_detail_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../di/injection.dart';
import '../../../route/route_list.dart';
import '../../base/model/product_model.dart';
import 'market_list_detail_edit_widget.dart';

class MarketListDetailResultWidget extends StatefulWidget {
  MarketListDetailResultWidget({
    required this.model,
    required this.marketListId,
    required this.onDelete,
    required this.onConfirm,
    RouteList? routeList,
    super.key,
  }) : _routeList = routeList ?? getIt.get();
  final MarketListDetailModel model;
  final RouteList _routeList;
  final String marketListId;
  final Function(Product product) onDelete;
  final Function() onConfirm;

  @override
  State<StatefulWidget> createState() {
    return MarketListDetailResultState();
  }
}

class MarketListDetailResultState extends State<MarketListDetailResultWidget> {
  bool isEdit = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model.name),
        actions: [
          isEdit
              ? IconButton(
                  onPressed: () {
                    widget.onConfirm();
                    setState(() {
                      isEdit = false;
                    });
                  },
                  icon: const Icon(
                    Icons.close,
                  ),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isEdit = true;
                    });
                  },
                  icon: const Icon(
                    Icons.edit,
                  ),
                )
        ],
      ),
      floatingActionButton: !isEdit
          ? FloatingActionButton.extended(
              onPressed: () {
                context.go(
                    widget._routeList.listRoute.getBulk(widget.marketListId));
              },
              label: const Text(
                "Adicionar produto",
              ),
            )
          : null,
      body: isEdit
          ? MarketListDetailEditWidget(
              model: widget.model,
              marketListId: widget.marketListId,
              onDelete: widget.onDelete,
            )
          : MarketListDetailViewWidget(
              model: widget.model,
              marketListId: widget.marketListId,
            ),
    );
  }
}
