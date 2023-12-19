import 'package:app/home/list/widget/market_list_view/market_list_view_interactor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../base/model/market_list_model.dart';

@injectable
class MarketListViewBloc
    extends Bloc<MarketListViewBlocEvent, MarketListViewBlocState> {
  MarketListViewBloc(
    this.interactor,
  ) : super(Idle()) {
    on<Load>(load);
  }

  final MarketListViewInteractor interactor;

  @visibleForTesting
  void load(
    MarketListViewBlocEvent event,
    Emitter<MarketListViewBlocState> emit,
  ) async {
    try {
      emit(Loading());
      final marketList = await interactor.loadList();
      emit(
        ShowList(
          list: marketList,
        ),
      );
    } catch (exception) {
      print(exception);
    }
  }
}

abstract class MarketListViewBlocEvent {}

abstract class MarketListViewBlocState {}

class Idle extends MarketListViewBlocState {}

class Loading extends MarketListViewBlocState {}

class ShowList extends MarketListViewBlocState {
  ShowList({
    required this.list,
  });
  final List<MarketListModel> list;
}

class Load extends MarketListViewBlocEvent {
  Load();
}
