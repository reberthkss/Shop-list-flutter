import 'package:app/home/base/model/product_model.dart';
import 'package:equatable/equatable.dart';

class ProductOccurrencesModel extends Equatable {
  const ProductOccurrencesModel({
    required this.product,
    this.occurences = 0,
  });
  final Product product;
  final int occurences;

  ProductOccurrencesModel copyWith(
    Product? product,
    int? occurences,
  ) {
    return ProductOccurrencesModel(
      product: product ?? this.product,
      occurences: occurences ?? this.occurences,
    );
  }

  factory ProductOccurrencesModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return ProductOccurrencesModel(
        product: Product.fromJson(null),
        occurences: 0,
      );
    }
    return ProductOccurrencesModel(
      product: Product.fromJson(json),
      occurences: int.parse(
        json['product_occurrence'],
      ),
    );
  }

  @override
  List<Object> get props => [
        product,
        occurences,
      ];
}
