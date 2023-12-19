import '../../base/model/market_list_model.dart';
import '../../base/model/product_model.dart';

class MarketListAddModel {
  const MarketListAddModel({
    required this.marketList,
    required this.product,
  });

  final List<MarketListModel> marketList;
  final Product? product;

  factory MarketListAddModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const MarketListAddModel(
        marketList: [],
        product: null,
      );
    }

    final List<dynamic> marketListModel = json["market_list"] ?? [];
    final productInfo = json["info"];

    return MarketListAddModel(
      product: productInfo != null ? Product.fromJson(productInfo) : null,
      marketList: marketListModel
          .map(
            (marketList) => MarketListModel.fromJson(marketList),
          )
          .toList(),
    );
  }
}
