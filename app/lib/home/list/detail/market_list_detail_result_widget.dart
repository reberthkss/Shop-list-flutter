import 'package:shop_list/home/list/detail/market_list_detail_model.dart';
import 'package:shop_list/home/list/detail/market_list_detail_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../di/injection.dart';
import '../../../route/route_list.dart';
import '../../base/model/product_model.dart';
import 'market_list_detail_check_list_widget.dart';
import 'market_list_detail_edit_widget.dart';

enum WidgetState { normal, editing, checking }

class MarketListDetailResultWidget extends StatefulWidget {
  MarketListDetailResultWidget({
    required this.model,
    required this.removedList,
    required this.checkedList,
    required this.marketListId,
    required this.onDelete,
    required this.onConfirm,
    required this.onCheck,
    RouteList? routeList,
    super.key,
  }) : _routeList = routeList ?? getIt.get();
  final MarketListDetailModel model;
  final List<Product> removedList;
  final List<Product> checkedList;
  final RouteList _routeList;
  final String marketListId;
  final Function(Product product) onDelete;
  final Function(Product product) onCheck;
  final Function() onConfirm;

  @override
  State<StatefulWidget> createState() {
    return MarketListDetailResultState();
  }
}

class MarketListDetailResultState extends State<MarketListDetailResultWidget> {
  WidgetState state = WidgetState.normal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model.name),
        actions: [
          Renderer(
            state: state,
            onNormal: IconButton(
              onPressed: () {
                setState(() {
                  state = WidgetState.editing;
                });
              },
              icon: const Icon(
                Icons.edit,
              ),
            ),
            onEditing: IconButton(
              onPressed: () {
                widget.onConfirm();
                setState(() {
                  state = WidgetState.normal;
                });
              },
              icon: const Icon(
                Icons.close,
              ),
            ),
            onChecking: const SizedBox.shrink(),
          ),
          Renderer(
            state: state,
            onNormal: IconButton(
              onPressed: () {
                setState(
                  () {
                    state = WidgetState.checking;
                  },
                );
              },
              icon: const Icon(Icons.check_box_sharp,),
            ),
            onEditing: const SizedBox.shrink(),
            onChecking: IconButton(
              onPressed: () {
                setState(
                  () {
                    state = WidgetState.normal;
                  },
                );
              },
              icon: const Icon(
                Icons.check_box_sharp,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Renderer(
        state: state,
        onNormal: FloatingActionButton.extended(
          onPressed: () {
            context
                .go(widget._routeList.listRoute.getBulk(widget.marketListId));
          },
          label: const Text(
            "Adicionar produto",
          ),
        ),
        onEditing: const SizedBox.shrink(),
        onChecking: const SizedBox.shrink(),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Renderer(
          state: state,
          onNormal: MarketListDetailViewWidget(
            model: widget.model,
            marketListId: widget.marketListId,
          ),
          onEditing: MarketListDetailEditWidget(
            model: widget.model,
            removedList: widget.removedList,
            marketListId: widget.marketListId,
            onDelete: widget.onDelete,
          ),
          onChecking: MarketListDetailCheckListWidget(
            productList: widget.model.products,
            checkedProducts: widget.checkedList,
            onCheck: widget.onCheck,
          ),
        ),
      ),
    );
  }
}

class Renderer extends StatelessWidget {
  const Renderer({
    required this.state,
    required this.onNormal,
    required this.onEditing,
    required this.onChecking,
    super.key,
  });
  final WidgetState state;
  final Widget onNormal;
  final Widget onEditing;
  final Widget onChecking;
  @override
  Widget build(BuildContext context) {
    switch (state) {
      case WidgetState.normal:
        {
          return onNormal;
        }
      case WidgetState.editing:
        {
          return onEditing;
        }
      case WidgetState.checking:
        {
          return onChecking;
        }
      default:
        {
          return const SizedBox.shrink();
        }
    }
  }
}
