import 'package:app/home/list/detail/market_list_detail_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../base/model/product_model.dart';
import 'market_list_detail_interactor.dart';

@injectable
class MarketListDetailCubit
    extends Bloc<MarketListDetailEvent, MarketListDetailState> {
  MarketListDetailCubit(
    this.interactor,
  ) : super(
          const MarketListDetailState(
            status: MarketListDetailStatus.IDLE,
            model: null,
          ),
        ) {
    on<RequestScreen>(onRequestScreen);
    on<RemoveProduct>(onRemoveProduct);
    on<ConfirmDeletion>(onConfirmDeletion);
  }

  final MarketListDetailInteractor interactor;

  void onRequestScreen(
      RequestScreen event, Emitter<MarketListDetailState> emit) async {
    final marketListId = event.marketListId;

    emit(
      state.copyWith(
        status: MarketListDetailStatus.LOADING,
      ),
    );
    try {
      final marketDetail = await interactor.getMarketListDetail(marketListId);
      emit(
        state.copyWith(
          status: MarketListDetailStatus.RESULT,
          model: marketDetail,
        ),
      );
    } catch (exception) {
      print(exception);
    }
  }

  void onRemoveProduct(
    RemoveProduct event,
    Emitter<MarketListDetailState> emit,
  ) {
    try {
      emit(
        state.copyWith(
          removedProducts: [
            ...state.removedProducts,
            event.product,
          ],
        ),
      );
    } catch (exception) {
      print(exception);
    }
  }

  void onConfirmDeletion(
    ConfirmDeletion event,
    Emitter<MarketListDetailState> emit,
  ) async {
    try {
      emit(state.copyWith(status: MarketListDetailStatus.REMOVING));

      await interactor.removeProducts(
        state.removedProducts,
        event.marketListId,
      );

      emit(state.copyWith(status: MarketListDetailStatus.REMOVING_SUCCESS));
    } catch (exception) {
      print(exception);
      emit(state.copyWith(status: MarketListDetailStatus.REMOVING_ERROR));
    }
  }
}

abstract class MarketListDetailEvent extends Equatable {}

class RequestScreen extends MarketListDetailEvent {
  RequestScreen({required this.marketListId});

  final String marketListId;

  @override
  List<Object> get props => [
        marketListId,
      ];
}

class RemoveProduct extends MarketListDetailEvent {
  RemoveProduct({required this.product});
  final Product product;

  @override
  List<Object> get props => [
        product,
      ];
}

class ConfirmDeletion extends MarketListDetailEvent {
  ConfirmDeletion({
    required this.marketListId,
  });
  final String marketListId;
  @override
  List<Object> get props => [];
}

class MarketListDetailState extends Equatable {
  const MarketListDetailState(
      {required this.status,
      required this.model,
      this.removedProducts = const []});
  final MarketListDetailStatus status;
  final MarketListDetailModel? model;
  final List<Product> removedProducts;

  MarketListDetailState copyWith({
    MarketListDetailStatus? status,
    MarketListDetailModel? model,
    List<Product>? removedProducts,
  }) {
    return MarketListDetailState(
      model: model ?? this.model,
      status: status ?? this.status,
      removedProducts: removedProducts ?? this.removedProducts,
    );
  }

  @override
  List<Object?> get props => [
        status,
        model,
      ];
}

enum MarketListDetailStatus {
  LOADING,
  RESULT,
  IDLE,
  ERROR,
  REMOVING,
  REMOVING_SUCCESS,
  REMOVING_ERROR
}
