import 'package:app/home/base/model/market_list_model.dart';
import 'package:app/home/base/model/price_model.dart';
import 'package:app/home/base/model/product_occurrences_model.dart';

class MarketListDetailModel extends MarketListModel {
  const MarketListDetailModel({
    required super.name,
    required super.id,
    required this.historicalPrice,
    required this.products,
    required this.total,
  });

  final List<Price> historicalPrice;
  final List<ProductOccurrencesModel> products;
  final String total;

  factory MarketListDetailModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const MarketListDetailModel(
        name: "",
        id: "-1",
        historicalPrice: [],
        products: [],
        total: "R\$ 0,00",
      );
    }

    List<dynamic> historicalPriceList = json["historicalPrice"] ?? [];
    List<dynamic> productList = json["products"] ?? [];

    return MarketListDetailModel(
      name: json["name"] ?? "",
      id: json["id"] ?? -1,
      historicalPrice: historicalPriceList
          .map(
            (historicalPrice) => Price.fromJson(
              historicalPrice,
            ),
          )
          .toList(),
      products: productList
          .map(
            (product) => ProductOccurrencesModel.fromJson(
              product,
            ),
          )
          .toList(),
      total: json["total"] ?? "R\$ 0,00",
    );
  }

  MarketListDetailModel copyWith({
    String? name,
    String? id,
    List<Price>? historicalPrice,
    List<ProductOccurrencesModel>? products,
    String? total,
  }) {
    return MarketListDetailModel(
      name: name ?? this.name,
      id: id ?? this.id,
      historicalPrice: historicalPrice ?? this.historicalPrice,
      products: products ?? this.products,
      total: total ?? this.total,
    );
  }

  @override
  List<Object> get props => [
        historicalPrice,
        products,
        name,
        id,
        total,
      ];
}
