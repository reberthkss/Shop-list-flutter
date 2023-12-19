import 'package:app/home/list/add/market_list_add_model.dart';
import 'package:injectable/injectable.dart';

import 'market_list_add_service.dart';

abstract class MarketListAddRepository {
  Future<MarketListAddModel> getMarketList(String? sku);
}

@Injectable(as: MarketListAddRepository)
class MarketListAddRepositoryImpl implements MarketListAddRepository {
  const MarketListAddRepositoryImpl(
    this.service,
  );

  final MarketListAddService service;

  @override
  Future<MarketListAddModel> getMarketList(String? sku) {
    return service.getMarketList(sku);
  }
}
