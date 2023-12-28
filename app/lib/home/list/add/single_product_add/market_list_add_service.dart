import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'market_list_add_bloc.dart';
import 'market_list_add_model.dart';

abstract class MarketListAddService {
  Future<MarketListAddModel> getMarketList(String? sku);
  Future<void> saveProduct(AddProductToMarketList event);
}

@Injectable(as: MarketListAddService)
class MarketListAddServiceImpl implements MarketListAddService {
  const MarketListAddServiceImpl(
    this.dio,
  );

  final Dio dio;
  @override
  Future<MarketListAddModel> getMarketList(String? sku) async {
    final marketListResponse = await dio.get("/market-list");
    Response<dynamic>? productInfoResponse;

    if (sku != null) {
      productInfoResponse = await dio.get("/product/$sku/info");
    }

    if (marketListResponse.statusCode != 200) {
      throw Exception();
    }

    final marketListJson = jsonDecode(marketListResponse.data);
    dynamic productInfoJson = {};

    if (productInfoResponse?.data != null) {
      productInfoJson = jsonDecode(productInfoResponse?.data);
    }

    return MarketListAddModel.fromJson(
      {
        ...productInfoJson,
        "market_list": marketListJson,
      },
    );
  }

  @override
  Future<void> saveProduct(AddProductToMarketList event) async {
    final response = await dio
        .post(
          "/market-list/${event.marketListId}/add",
          data: {
            "productId": event.productId
          }
        );
    if (response.statusCode == 200) {
      return;
    }
    throw Exception(
        "Response => ${response.statusCode} - ${response.statusMessage}");
  }
}
