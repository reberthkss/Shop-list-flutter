import 'dart:convert';

import 'package:app/home/products/detail/data/product_detail_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class ProductDetailService {
  Future<ProductDetail> getProductDetail(String sku);
}

@Injectable(as: ProductDetailService)
class ProductDetailServiceImpl implements ProductDetailService {
  ProductDetailServiceImpl(
    this.dio,
  );

  final Dio dio;
  @override
  Future<ProductDetail> getProductDetail(String sku) async {
    final response = await dio.get(
      "/product/$sku/detail"
    );
    dynamic data;
    if (response.statusCode == 200) {
      data = jsonDecode(response.data) ?? null;
    }

    if (data != null) {
      final productDetail = ProductDetail.fromJson(data);
      return productDetail;
    }

    throw Exception();
  }
}
