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
    state.selectedProductList.forEach(
      (product) {
        interactor.saveProduct(
          AddProductToMarketList(
            productId: product.id,
            marketListId: event.marketListId,
          ),
        );
      },
    );
  }
}

abstract class BulkAddEvent {}

class BulkAddState {
  final List<Product> selectedProductList;

  const BulkAddState({
    this.selectedProductList = const [],
  });

  BulkAddState copyWith({List<Product>? productList}) {
    return BulkAddState(
        selectedProductList: productList ?? selectedProductList);
  }
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
