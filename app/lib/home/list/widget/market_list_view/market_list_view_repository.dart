import 'package:app/home/base/model/market_list_model.dart';
import 'package:injectable/injectable.dart';

import 'market_list_view_service.dart';

abstract class MarketListViewRepository {
  Future<List<MarketListModel>> loadList();
}

@Injectable(as: MarketListViewRepository)
class MarketListViewRepositoryImpl extends MarketListViewRepository {
  MarketListViewRepositoryImpl(
    this.service,
  );

  final MarketListViewService service;

  @override
  Future<List<MarketListModel>> loadList() {
    return service.loadList();
  }
}
