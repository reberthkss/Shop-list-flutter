import 'package:shop_list/route/route_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../di/injection.dart';
import 'market_list_detail_cubit.dart';
import 'market_list_detail_result_widget.dart';

class MarketListDetailPage extends StatelessWidget {
  MarketListDetailPage({
    required this.marketListId,
    RouteList? routeList,
    MarketListDetailCubit? marketListDetailCubit,
    super.key,
  }) : _marketListDetailCubit = marketListDetailCubit ?? getIt.get();

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
      child: BlocConsumer<MarketListDetailCubit, MarketListDetailState>(
        listener: (context, state) {
          if (state.status == MarketListDetailStatus.removingSuccess) {
            Fluttertoast.showToast(
              msg: "Os produtos foram removidos da lista!",
            );
            context.read<MarketListDetailCubit>().add(
                  RequestScreen(
                    marketListId: marketListId,
                  ),
                );
          }

          if (state.status == MarketListDetailStatus.removingError) {
            Fluttertoast.showToast(
              msg:
                  "Houve um erro durante a remoção dos produtos! Tente novamente",
            );
          }
        },
        builder: (context, state) {
          switch (state.status) {
            case MarketListDetailStatus.loading:
            case MarketListDetailStatus.removing:
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            case MarketListDetailStatus.result:
            case MarketListDetailStatus.removingSuccess:
            case MarketListDetailStatus.removingError:
              {
                if (state.model == null) {
                  return const SizedBox.shrink();
                }

                return MarketListDetailResultWidget(
                  model: state.model!,
                  removedList: state.removedProducts,
                  checkedList: state.checkedProducts,
                  marketListId: marketListId,
                  onDelete: (product) {
                    context.read<MarketListDetailCubit>().add(
                          RemoveProduct(product: product),
                        );
                  },
                  onConfirm: () {
                    context.read<MarketListDetailCubit>().add(
                          ConfirmDeletion(
                            marketListId: marketListId,
                          ),
                        );
                  },
                  onCheck: (product) {
                    context.read<MarketListDetailCubit>().add(
                          Check(
                            product: product,
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
