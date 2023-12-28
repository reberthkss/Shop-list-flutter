import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class MarketListCreateService {
  Future<void> create(String name);
}

@Injectable(as: MarketListCreateService)
class MarketListCreateServiceImpl extends MarketListCreateService {
  MarketListCreateServiceImpl(this.dio);

  final Dio dio;

  @override
  Future<void> create(String name) async {
    final response = await dio.post(
      "/market-list",
      data: {"name": name},
    );

    if (response.statusCode == 200) {
      return;
    }

    throw Exception("Status: ${response.statusCode}");
  }
}
