import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'market_list_create_interactor.dart';

@injectable
class MarketListHomeCreateBloc
    extends Bloc<MarketListHomeCreateEvent, MarketListHomeCreateState> {
  MarketListHomeCreateBloc(
    this.interactor,
  ) : super(Idle()) {
    on<CreateMarketList>(create);
  }
  final MarketListCreateInteractor interactor;

  @visibleForTesting
  void create(
    CreateMarketList event,
    Emitter<MarketListHomeCreateState> emit,
  ) async {
    try {
      emit(Loading());
      await interactor.create(event.name);
      emit(Success());
    } catch (exception) {
      print(exception);
    }
  }
}

abstract class MarketListHomeCreateEvent {}

abstract class MarketListHomeCreateState {}

class Idle extends MarketListHomeCreateState {}

class Loading extends MarketListHomeCreateState {}

class Success extends MarketListHomeCreateState {}

class CreateMarketList extends MarketListHomeCreateEvent {
  CreateMarketList({
    required this.name,
  });
  final String name;
}
