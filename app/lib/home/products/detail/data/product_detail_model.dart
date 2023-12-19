import 'package:app/home/base/model/price_model.dart';
import 'package:app/home/base/model/product_model.dart';
import 'package:equatable/equatable.dart';

class ProductDetail extends Equatable {
  const ProductDetail({
    required this.historicPrice,
    required this.info,
  });

  final List<Price> historicPrice;
  final Product info;

  factory ProductDetail.fromJson(Map<dynamic, dynamic>? json) {
    if (json == null) {
      return defaultValue();
    }
    final List<dynamic> jsonList = json['historicPrice'] ?? [];
    final List<Price> historicPriceList = List.from(
      jsonList.map(
        (price) => Price.fromJson(price),
      ),
    );
    return ProductDetail(
      historicPrice: historicPriceList,
      info: Product.fromJson(
        json['info'],
      ),
    );
  }

  static ProductDetail defaultValue() {
    return ProductDetail(
      historicPrice: const [],
      info: Product.defaultValue(),
    );
  }

  @override
  List<Object> get props => [
        historicPrice,
      ];
}
