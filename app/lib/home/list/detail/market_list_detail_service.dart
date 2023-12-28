import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'market_list_detail_model.dart';

abstract class MarketListDetailService {
  Future<MarketListDetailModel> getMarketListDetail(String id);
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
    if (response.statusCode == 200) {
      final json = jsonDecode(response.data);
      return MarketListDetailModel.fromJson(json);
    }
    throw Exception("Status code => ${response.statusCode}");
  }
}
