import 'dart:convert';

import 'package:shop_list/home/base/model/market_list_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class MarketListViewService {
  Future<List<MarketListModel>> loadList();
}

@Injectable(as: MarketListViewService)
class MarketListViewServiceImpl extends MarketListViewService {
  MarketListViewServiceImpl(this.dio);

  final Dio dio;

  @override
  Future<List<MarketListModel>> loadList() async {
    final response = await dio.get("/market-list");

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.data) ?? [];
      return data.map((list) => MarketListModel.fromJson(list)).toList();
    }

    throw Exception();
  }
}
