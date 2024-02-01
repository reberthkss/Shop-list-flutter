import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../base/model/product_model.dart';
import '../single_product_add/market_list_add_bloc.dart';
import '../single_product_add/market_list_add_interactor.dart';

@injectable
class BulkAddCubit extends Bloc<BulkAddEvent, BulkAddState> {
  BulkAddCubit(
    this.interactor,
  ) : super(
          const BulkAddState(),
        ) {
    on<Add>(onAdd);
    on<Confirm>(onConfirm);
    on<Remove>(onRemoveProduct);
  }
  final MarketListInteractor interactor;

  void onAdd(Add event, Emitter<BulkAddState> emit) {
    emit(
      state.copyWith(
        productList: [
          ...state.selectedProductList,
          event.product,
        ],
      ),
    );
  }

  void onConfirm(Confirm event, Emitter<BulkAddState> emit) {
    for (var product in state.selectedProductList) {
      interactor.saveProduct(
        AddProductToMarketList(
          productId: product.id,
          marketListId: event.marketListId,
        ),
      );
    }
  }

  void onRemoveProduct(Remove event, Emitter<BulkAddState> emit) {
    final indexOfProduct = state.selectedProductList.indexWhere(
      (product) => product.id == event.product.id,
    );

    if (indexOfProduct == -1) {
      return;
    }

    emit(
      state.copyWith(
        productList: [
          ...state.selectedProductList.sublist(0, indexOfProduct),
          ...state.selectedProductList.sublist(indexOfProduct + 1)
        ],
      ),
    );
  }
}

abstract class BulkAddEvent {}

class BulkAddState extends Equatable {
  final List<Product> selectedProductList;

  const BulkAddState({
    this.selectedProductList = const [],
  });

  BulkAddState copyWith({List<Product>? productList}) {
    return BulkAddState(
      selectedProductList: productList ?? selectedProductList,
    );
  }

  @override
  List<Object> get props => [
        selectedProductList,
      ];
}

class Add extends BulkAddEvent {
  Add({
    required this.product,
  });

  final Product product;
}

class Confirm extends BulkAddEvent {
  Confirm({
    required this.marketListId,
  });

  final String marketListId;
}

class Remove extends BulkAddEvent {
  Remove({
    required this.product,
  });
  final Product product;
}
