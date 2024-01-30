import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../base/model/product_model.dart';
import 'market_list_detail_model.dart';

abstract class MarketListDetailService {
  Future<MarketListDetailModel> getMarketListDetail(String id);
  Future<void> removeProducts(
      List<Product> productsToRemove, String marketListId);
}

@Injectable(as: MarketListDetailService)
class MarketListDetailServiceImpl extends MarketListDetailService {
  MarketListDetailServiceImpl(
    this.dio,
  );

  final Dio dio;

  @override
  Future<MarketListDetailModel> getMarketListDetail(String id) async {
    final response = await dio.get("/market-list/$id/detail");
    final json = jsonDecode(response.data);
    return MarketListDetailModel.fromJson(json);
  }

  @override
  Future<void> removeProducts(
    List<Product> productsToRemove,
    String marketListId,
  ) async {
    await dio.post("/market-list/$marketListId/products/remove", data: {
      "products": productsToRemove
          .map(
            (product) => product.id,
          )
          .toList()
    });
  }
}
