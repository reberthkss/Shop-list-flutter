import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/injection.dart';
import 'market_list_detail_cubit.dart';

class MarketListDetailPage extends StatelessWidget {
  MarketListDetailPage(
      {required this.marketListId,
      MarketListDetailCubit? marketListDetailCubit,
      super.key})
      : _marketListDetailCubit = marketListDetailCubit ?? getIt.get();

  final MarketListDetailCubit _marketListDetailCubit;
  final String marketListId;

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
