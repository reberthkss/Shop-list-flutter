import 'package:app/home/list/detail/market_list_detail_model.dart';
import 'package:injectable/injectable.dart';

import 'market_list_detail_service.dart';

abstract class MarketListDetailRepository {
  Future<MarketListDetailModel> getMarketListDetail(String id);
}

@Injectable(as: MarketListDetailRepository)
class MarketListDetailRepositoryImpl extends MarketListDetailRepository {
  MarketListDetailRepositoryImpl(
    this.service,
  );

  final MarketListDetailService service;

  @override
  Future<MarketListDetailModel> getMarketListDetail(String id) {
    return service.getMarketListDetail(id);
  }
}
