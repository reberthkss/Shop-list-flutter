import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.name,
    required this.id,
    required this.imageUrl,
    required this.price,
    required this.departmentId,
  });

  final String name;
  final String id;
  final String imageUrl;
  final String price;
  final String departmentId;

  factory Product.fromJson(Map<dynamic, dynamic>? json) {
    if (json == null) {
      return defaultValue();
    }
    return Product(
      name: json['name'] ?? '',
      id: json['id'] ?? '',
      imageUrl: json['thumb'] ?? '',
      price: json['price'] ?? '',
      departmentId: json['departmentId'] ?? '',
    );
  }

  static Product defaultValue() {
    return const Product(
      name: '',
      id: '',
      imageUrl: '',
      price: '',
      departmentId: '',
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
