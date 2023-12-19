import 'package:injectable/injectable.dart';

import 'market_list_create_repository.dart';

abstract class MarketListCreateInteractor {
  Future<void> create(String name);
}

@Injectable(as: MarketListCreateInteractor)
class MarketListCreateInteractorImpl extends MarketListCreateInteractor {
  MarketListCreateInteractorImpl(
    this.repository,
  );

  final MarketListCreateRepository repository;

  @override
  Future<void> create(String name) => repository.create(name);

}