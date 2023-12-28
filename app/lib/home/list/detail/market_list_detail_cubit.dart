import 'package:app/home/list/detail/market_list_detail_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'market_list_detail_interactor.dart';

@injectable
class MarketListDetailCubit
    extends Bloc<MarketListDetailEvent, MarketListDetailState> {
  MarketListDetailCubit(
    this.interactor,
  ) : super(Idle()) {
    on<RequestScreen>(onRequestScreen);
  }

  final MarketListDetailInteractor interactor;

  void onRequestScreen(
      RequestScreen event, Emitter<MarketListDetailState> emit) async {
    final marketListId = event.marketListId;

    emit(
      Loading(),
    );
    try {
      final marketDetail = await interactor.getMarketListDetail(marketListId);
      emit(
        ScreenResult(
          model: marketDetail,
        ),
      );
    } catch (exception) {
      print(exception);
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

abstract class MarketListDetailState extends Equatable {}

class Idle extends MarketListDetailState {
  Idle();

  @override
  List<Object> get props => [];
}

class Loading extends MarketListDetailState {
  Loading();

  @override
  List<Object> get props => [];
}

class ScreenResult extends MarketListDetailState {
  ScreenResult({required this.model});

  final MarketListDetailModel model;

  @override
  List<Object> get props => [
        model,
      ];
}
