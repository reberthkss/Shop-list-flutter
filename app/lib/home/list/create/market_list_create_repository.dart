import 'package:injectable/injectable.dart';

import 'market_list_create_service.dart';

abstract class MarketListCreateRepository {
  Future<void> create(String name);
}

@Injectable(as: MarketListCreateRepository)
class MarketListCreateRepositoryImpl implements MarketListCreateRepository {
  const MarketListCreateRepositoryImpl(
    this.service,
  );

  final MarketListCreateService service;
  @override
  Future<void> create(String name) => service.create(name);
}
