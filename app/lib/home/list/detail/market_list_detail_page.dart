import 'package:app/route/route_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../di/injection.dart';
import '../../products/widgets/product_horizontal_card_widget.dart';
import 'market_list_detail_cubit.dart';

class MarketListDetailPage extends StatelessWidget {
  MarketListDetailPage({
    required this.marketListId,
    RouteList? routeList,
    MarketListDetailCubit? marketListDetailCubit,
    super.key,
  })  : _marketListDetailCubit = marketListDetailCubit ?? getIt.get(),
        _routeList = routeList ?? getIt.get();

  final MarketListDetailCubit _marketListDetailCubit;
  final String marketListId;
  final RouteList _routeList;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _marketListDetailCubit
        ..add(
          RequestScreen(
            marketListId: marketListId,
          ),
        ),
      child: BlocBuilder<MarketListDetailCubit, MarketListDetailState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case Loading:
              {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            case ScreenResult:
              {
                state as ScreenResult;
                return Scaffold(
                  appBar: AppBar(
                    title: Text(state.model.name),
                  ),
                  floatingActionButton: FloatingActionButton.extended(
                    onPressed: () {
                      context.go(_routeList.listRoute.getBulk(marketListId));
                    },
                    label: const Text(
                      "Adicionar produto",
                    ),
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.model.products.length,
                          itemBuilder: (ctx, index) {
                            final product = state.model.products[index];
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
                            Expanded(
                              child: Text("TOTAL"),
                            ),
                            Expanded(
                              child: Text(
                                state.model.total,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }
            default:
              {
                return SizedBox.shrink();
              }
          }
        },
      ),
    );
  }
}
