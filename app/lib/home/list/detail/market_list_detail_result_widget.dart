import 'package:app/home/list/detail/market_list_detail_model.dart';
import 'package:app/home/list/detail/market_list_detail_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../di/injection.dart';
import '../../../route/route_list.dart';
import '../../base/model/product_model.dart';
import 'market_list_detail_edit_widget.dart';

enum WidgetState { NORMAL, EDITING, CHECKING }

class MarketListDetailResultWidget extends StatefulWidget {
  MarketListDetailResultWidget({
    required this.model,
    required this.removedList,
    required this.marketListId,
    required this.onDelete,
    required this.onConfirm,
    RouteList? routeList,
    super.key,
  }) : _routeList = routeList ?? getIt.get();
  final MarketListDetailModel model;
  final List<Product> removedList;
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
  WidgetState state = WidgetState.NORMAL;

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
                  state = WidgetState.EDITING;
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
                  state = WidgetState.NORMAL;
                });
              },
              icon: const Icon(
                Icons.close,
              ),
            ),
            onChecking: SizedBox.shrink(),
          ),
          Renderer(
            state: state,
            onNormal: IconButton(
              onPressed: () {
                setState(
                  () {
                    state = WidgetState.CHECKING;
                  },
                );
              },
              icon: Icon(Icons.check_box_sharp),
            ),
            onEditing: SizedBox.shrink(),
            onChecking: IconButton(
              onPressed: () {
                setState(
                  () {
                    state = WidgetState.NORMAL;
                  },
                );
              },
              icon: Icon(Icons.check_box_sharp),
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
        onEditing: SizedBox.shrink(),
        onChecking: SizedBox.shrink(),
      ),
      body: Renderer(
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
        onChecking: SizedBox.shrink(),
      ),
    );
  }
}

class Renderer extends StatelessWidget {
  const Renderer(
      {required this.state,
      required this.onNormal,
      required this.onEditing,
      required this.onChecking});
  final WidgetState state;
  final Widget onNormal;
  final Widget onEditing;
  final Widget onChecking;
  @override
  Widget build(BuildContext context) {
    switch (state) {
      case WidgetState.NORMAL:
        {
          return onNormal;
        }
      case WidgetState.EDITING:
        {
          return onEditing;
        }
      case WidgetState.CHECKING:
        {
          return onChecking;
        }
      default:
        {
          return SizedBox.shrink();
        }
    }
  }
}
