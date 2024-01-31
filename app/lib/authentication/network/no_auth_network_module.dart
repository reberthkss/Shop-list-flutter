import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NoAuthNetworkModule {
  @Named("NoAuthDio")
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: BASE_URL,
    )
  );
}


const String BASE_URL = "http://192.168.0.9:3000";