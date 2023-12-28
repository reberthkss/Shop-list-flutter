import 'package:app/home/list/detail/market_list_detail_model.dart';
import 'package:injectable/injectable.dart';

import 'market_list_detail_repository.dart';

abstract class MarketListDetailInteractor {
  Future<MarketListDetailModel> getMarketListDetail(String id);
}

@Injectable(as: MarketListDetailInteractor)
class MarketListDetailInteractorImpl extends MarketListDetailInteractor {
  MarketListDetailInteractorImpl(
    this.repository,
  );

  final MarketListDetailRepository repository;

  @override
  Future<MarketListDetailModel> getMarketListDetail(String id) {
    return repository.getMarketListDetail(id);
  }
}
