import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


@module
abstract class NetworkModule {
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: BASE_URL,
    )
  );
}


final String BASE_URL = "http://localhost:3000";