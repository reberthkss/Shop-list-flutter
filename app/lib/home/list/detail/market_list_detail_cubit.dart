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
            status: MarketListDetailStatus.idle,
            model: null,
          ),
        ) {
    on<RequestScreen>(onRequestScreen);
    on<RemoveProduct>(onRemoveProduct);
    on<ConfirmDeletion>(onConfirmDeletion);
    on<Check>(onCheck);
  }

  final MarketListDetailInteractor interactor;

  void onRequestScreen(
      RequestScreen event, Emitter<MarketListDetailState> emit) async {
    final marketListId = event.marketListId;

    emit(
      state.copyWith(
        status: MarketListDetailStatus.loading,
      ),
    );
    try {
      final marketDetail = await interactor.getMarketListDetail(marketListId);
      emit(
        state.copyWith(
          status: MarketListDetailStatus.result,
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
      final indexOfProductInRemovedList = state.removedProducts
          .indexWhere((product) => product.id == event.product.id);

      List<Product> result = [];

      if (indexOfProductInRemovedList != -1) {
        result = [
          ...state.removedProducts.sublist(0, indexOfProductInRemovedList),
          ...state.removedProducts.sublist(indexOfProductInRemovedList + 1)
        ];
      } else {
        result = [
          ...state.removedProducts,
          event.product,
        ];
      }

      emit(
        state.copyWith(
          removedProducts: result,
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
      emit(state.copyWith(status: MarketListDetailStatus.removing));

      await interactor.removeProducts(
        state.removedProducts,
        event.marketListId,
      );

      emit(state.copyWith(status: MarketListDetailStatus.removingSuccess));
    } catch (exception) {
      print(exception);
      emit(state.copyWith(status: MarketListDetailStatus.removingError));
    }
  }

  void onCheck(Check event, Emitter<MarketListDetailState> emit) {
    MarketListDetailState newState;
    final productIndex = state.checkedProducts.indexWhere(
      (product) => product.id == event.product.id,
    );

    if (productIndex != -1) {
      newState = state.copyWith(checkedProducts: [
        ...state.checkedProducts.sublist(0, productIndex),
        ...state.checkedProducts.sublist(productIndex + 1)
      ]);
    } else {
      newState = state.copyWith(
        checkedProducts: [
          ...state.checkedProducts,
          event.product,
        ],
      );
    }
    emit(newState);
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

class Check extends MarketListDetailEvent {
  Check({
    required this.product,
  });
  final Product product;
  @override
  List<Object> get props => [];
}

class MarketListDetailState extends Equatable {
  const MarketListDetailState({
    required this.status,
    required this.model,
    this.checkedProducts = const [],
    this.removedProducts = const [],
  });
  final MarketListDetailStatus status;
  final MarketListDetailModel? model;
  final List<Product> removedProducts;
  final List<Product> checkedProducts;

  MarketListDetailState copyWith({
    MarketListDetailStatus? status,
    MarketListDetailModel? model,
    List<Product>? removedProducts,
    List<Product>? checkedProducts,
  }) {
    return MarketListDetailState(
      model: model ?? this.model,
      status: status ?? this.status,
      removedProducts: removedProducts ?? this.removedProducts,
      checkedProducts: checkedProducts ?? this.checkedProducts,
    );
  }

  @override
  List<Object?> get props => [
        status,
        model,
        removedProducts,
        checkedProducts,
      ];
}

enum MarketListDetailStatus {
  loading,
  result,
  idle,
  error,
  removing,
  removingSuccess,
  removingError,
}
