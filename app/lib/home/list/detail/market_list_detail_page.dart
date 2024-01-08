import 'package:app/route/route_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../../../di/injection.dart';
import '../../products/widgets/product_horizontal_card_widget.dart';
import 'market_list_detail_cubit.dart';
import 'market_list_detail_result_widget.dart';

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
          switch (state.status) {
            case MarketListDetailStatus.LOADING:
            case MarketListDetailStatus.REMOVING:
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            case MarketListDetailStatus.RESULT:
            case MarketListDetailStatus.REMOVING_SUCCESS:
            case MarketListDetailStatus.REMOVING_ERROR:
              {
                if (state.model == null) {
                  return const SizedBox.shrink();
                }

                WidgetsBinding.instance.addPostFrameCallback(
                  (timeStamp) {
                    if (state.status ==
                        MarketListDetailStatus.REMOVING_SUCCESS) {
                      Fluttertoast.showToast(
                        msg: "Os produtos foram removidos da lista!",
                      );
                      _marketListDetailCubit.add(
                        RequestScreen(
                          marketListId: marketListId,
                        ),
                      );
                    }

                    if (state.status == MarketListDetailStatus.REMOVING_ERROR) {
                      Fluttertoast.showToast(
                        msg:
                            "Houve um erro durante a remoção dos produtos! Tente novamente",
                      );
                    }
                  },
                );

                return MarketListDetailResultWidget(
                  model: state.model!,
                  marketListId: marketListId,
                  onDelete: (product) {
                    _marketListDetailCubit.add(
                      RemoveProduct(product: product),
                    );
                  },
                  onConfirm: () {
                    _marketListDetailCubit.add(
                      ConfirmDeletion(
                        marketListId: marketListId,
                      ),
                    );
                  },
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
