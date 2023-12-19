import 'package:app/home/list/add/market_list_add_model.dart';
import 'package:injectable/injectable.dart';

import 'market_list_add_repository.dart';

abstract class MarketListInteractor {
  Future<MarketListAddModel> getMarketList(String? sku);
}

@Injectable(as: MarketListInteractor)
class MarketListInteractorImpl implements MarketListInteractor {
  const MarketListInteractorImpl(this.repository);

  final MarketListAddRepository repository;

  @override
  Future<MarketListAddModel> getMarketList(String? sku) {
    return repository.getMarketList(sku);
  }
}
