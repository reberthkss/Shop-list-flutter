import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../di/injection.dart';
import '../../../../route/route_list.dart';
import '../list_card/list_card.widget.dart';
import 'market_list_view_bloc.dart';

class MarketListViewWidget extends StatelessWidget {
  MarketListViewWidget({
    routeList,
    MarketListViewBloc? bloc,
    super.key,
  })  : _routeList = routeList ?? getIt.get(),
        _bloc = bloc ?? getIt.get();

  final RouteList _routeList;
  final MarketListViewBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MarketListViewBloc>(
      create: (ctx) => _bloc..add(Load()),
      child: BlocBuilder<MarketListViewBloc, MarketListViewBlocState>(
        builder: (ctx, state) {
          switch (state.runtimeType) {
            case Loading:
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            case ShowList:
              {
                state as ShowList;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                     const Text("Suas listas de mercado"),
                      SizedBox(
                        child: ListView.builder(
                          itemCount: state.list.length,
                          shrinkWrap: true,
                          itemBuilder: (ctx, index) {
                            final model = state.list[index];
                            return ListCardWidget(
                              model: model,
                              onTap: (id) {
                                context.go(
                                  _routeList.listRoute.getDetail(id),
                                );
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
              }
            default:
              {
                return const SizedBox.shrink();
              }
          }
        },
      ),
    );
  }
}
