import 'package:app/home/list/detail/market_list_detail_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MarketListDetailCubit
    extends Bloc<MarketListDetailEvent, MarketListDetailState> {
  MarketListDetailCubit() : super(Idle()) {
    on<RequestScreen>(onRequestScreen);
  }

  void onRequestScreen(
      RequestScreen event, Emitter<MarketListDetailState> emit) async {
    final marketListId = event.marketListId;

    emit(
      Loading(),
    );

    await Future.delayed(Duration(seconds: 2));

    emit(
      ScreenResult(
        model: MarketListDetailModel(
          name: 'Lista 2',
          id: marketListId,
          historicalPrice: [],
        ),
      ),
    );
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
