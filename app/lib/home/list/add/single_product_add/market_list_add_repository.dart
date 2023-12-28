import 'package:injectable/injectable.dart';

import 'market_list_add_bloc.dart';
import 'market_list_add_model.dart';
import 'market_list_add_service.dart';

abstract class MarketListAddRepository {
  Future<MarketListAddModel> getMarketList(String? sku);
  Future<void> saveProduct(AddProductToMarketList event);
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
  
  @override
  Future<void> saveProduct(AddProductToMarketList event) {
    return service.saveProduct(event);
  }
}
