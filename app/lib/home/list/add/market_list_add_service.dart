import 'dart:convert';

import 'package:app/home/list/add/market_list_add_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class MarketListAddService {
  Future<MarketListAddModel> getMarketList(String? sku);
}

@Injectable(as: MarketListAddService)
class MarketListAddServiceImpl implements MarketListAddService {
  const MarketListAddServiceImpl(
    this.dio,
  );

  final Dio dio;
  @override
  Future<MarketListAddModel> getMarketList(String? sku) async {
    final marketListResponse = await dio.get("/market_list");
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
}
