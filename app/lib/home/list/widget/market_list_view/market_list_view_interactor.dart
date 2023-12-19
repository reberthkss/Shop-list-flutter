import 'package:injectable/injectable.dart';

import '../../../base/model/market_list_model.dart';
import 'market_list_view_repository.dart';

abstract class MarketListViewInteractor {
  Future<List<MarketListModel>> loadList();
}


@Injectable(as: MarketListViewInteractor)
class MarketListViewInteractorImpl extends MarketListViewInteractor {
  MarketListViewInteractorImpl(
    this.repository
  );

  final MarketListViewRepository repository;
  
  @override
  Future<List<MarketListModel>> loadList() async {
    return repository.loadList();
  }

}