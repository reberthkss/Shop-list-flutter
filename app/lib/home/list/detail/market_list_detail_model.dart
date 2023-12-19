import 'package:app/home/base/model/market_list_model.dart';
import 'package:app/home/base/model/price_model.dart';

class MarketListDetailModel extends MarketListModel {
  const MarketListDetailModel({
    required super.name,
    required super.id,
    required this.historicalPrice,
  });

  final List<Price> historicalPrice;

  @override
  List<Object> get props => [
        historicalPrice,
      ];
}
