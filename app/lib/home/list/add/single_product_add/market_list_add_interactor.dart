import 'package:injectable/injectable.dart';

import 'market_list_add_bloc.dart';
import 'market_list_add_model.dart';
import 'market_list_add_repository.dart';

abstract class MarketListInteractor {
  Future<MarketListAddModel> getMarketList(String? sku);
  Future<void> saveProduct(AddProductToMarketList event);
}

@Injectable(as: MarketListInteractor)
class MarketListInteractorImpl implements MarketListInteractor {
  const MarketListInteractorImpl(this.repository);

  final MarketListAddRepository repository;

  @override
  Future<MarketListAddModel> getMarketList(String? sku) {
    return repository.getMarketList(sku);
  }
  
  @override
  Future<void> saveProduct(AddProductToMarketList event) {
    return repository.saveProduct(event);
  }
}
