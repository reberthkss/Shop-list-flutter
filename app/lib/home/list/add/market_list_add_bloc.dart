import 'package:app/home/list/add/market_list_add_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../base/model/market_list_model.dart';
import '../../base/model/product_model.dart';
import 'market_list_add_interactor.dart';

@injectable
class MarketListAddBloc extends Bloc<Event, MarketListAddState> {
  MarketListAddBloc(this.interactor) : super(Idle()) {
    on<LoadMarketList>(loadMarketList);
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
}

abstract class Event {}

abstract class MarketListAddState {}

class Idle extends MarketListAddState {
  Idle();
}

class Loading extends MarketListAddState {
  Loading();
}

class LoadMarketList extends Event {
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
