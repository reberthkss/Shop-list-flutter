import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../base/model/product_model.dart';

abstract class ProductsService {
  Future<List<Product>> getProductListByDepartment(
    String departmentId,
    String page,
  );
}

@Injectable(as: ProductsService)
class ProductsServiceImpl implements ProductsService {
  ProductsServiceImpl(
    this.dio,
  );

  final Dio dio;

  @override
  Future<List<Product>> getProductListByDepartment(
    String departmentId,
    String page,
  ) async {
    final response = await dio.request(
      "/department/$departmentId/products",
      queryParameters: {"page": page},
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.data);
      final List<dynamic> productList = json["productList"];
      return productList
          .map(
            (product) => Product.fromJson(
              product,
            ),
          )
          .toList();
    }

    throw Exception("status code => ${response.statusCode}");
  }
}
