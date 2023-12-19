import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.name,
    required this.id,
    required this.imageUrl,
    required this.price,
  });

  final String name;
  final String id;
  final String imageUrl;
  final String price;

  factory Product.fromJson(Map<dynamic, dynamic>? json) {
    if (json == null) {
      return defaultValue();
    }
    return Product(
      name: json['name'] ?? '',
      id: json['id'] ?? '',
      imageUrl: json['thumb'] ?? '',
      price: json['price'] ?? '',
    );
  }

  static Product defaultValue() {
    return const Product(
      name: '',
      id: '',
      imageUrl: '',
      price: '',
    );
  }

  @override
  List<Object> get props => [
        name,
        id,
        imageUrl,
        price,
      ];
}
