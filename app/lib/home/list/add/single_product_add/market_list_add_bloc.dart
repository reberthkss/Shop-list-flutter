import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../base/model/market_list_model.dart';
import '../../../base/model/product_model.dart';
import 'market_list_add_interactor.dart';

@injectable
class MarketListAddBloc extends Bloc<MarketListAddEvent, MarketListAddState> {
  MarketListAddBloc(this.interactor) : super(Idle()) {
    on<LoadMarketList>(loadMarketList);
    on<AddProductToMarketList>(addProductToMarketList);
  }

  final MarketListInteractor interactor;

  void loadMarketList(
      LoadMarketList event, Emitter<MarketListAddState> emit) async {
    try {
      emit(
        Loading(),
      );
      final marketListAddModel = await interactor.getMarketList(
        event.productSku,
      );
      emit(
        ShowMarketList(
          product: marketListAddModel.product,
          marketList: marketListAddModel.marketList,
        ),
      );
    } catch (exception) {
      print(exception);
    }
  }

  void addProductToMarketList(
    AddProductToMarketList event,
    Emitter<MarketListAddState> emit,
  ) async {
    try {
      emit(Loading());
      await interactor.saveProduct(event);
      emit(SuccessOnAdd());
    } catch (exception) {
      print(exception);
    }
  }
}

abstract class MarketListAddEvent {}

abstract class MarketListAddState {}

class Idle extends MarketListAddState {
  Idle();
}

class Loading extends MarketListAddState {
  Loading();
}

class LoadMarketList extends MarketListAddEvent {
  LoadMarketList({
    required this.productSku,
  });
  final String? productSku;
}

class ShowMarketList extends MarketListAddState {
  ShowMarketList({
    required this.product,
    required this.marketList,
  });

  final Product? product;
  final List<MarketListModel> marketList;
}

class AddProductToMarketList extends MarketListAddEvent {
  AddProductToMarketList({
    required this.productId,
    required this.marketListId,
  });

  final String productId;
  final String marketListId;
}

class SuccessOnAdd extends MarketListAddState {
  SuccessOnAdd();
}
