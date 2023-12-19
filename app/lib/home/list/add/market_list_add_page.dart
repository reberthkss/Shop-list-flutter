import 'package:app/home/list/add/market_list_add_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/injection.dart';
import 'market_list_add_bloc.dart';

class MarketListAddPage extends StatelessWidget {
  MarketListAddPage({
    required this.productSku,
    MarketListAddBloc? marketListAddBloc,
    super.key,
  }) : _marketListAddBloc = marketListAddBloc ?? getIt.get();
  final String? productSku;
  final MarketListAddBloc _marketListAddBloc;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MarketListAddBloc>(
      create: (_) => _marketListAddBloc..add(
        LoadMarketList(
          productSku: productSku
        )
      ),
      child: BlocBuilder<MarketListAddBloc, MarketListAddState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case Loading:
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            case ShowMarketList:
              {
                state as ShowMarketList;
                return MarketListAddWidget(
                  product: state.product,
                  marketList: state.marketList,
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
