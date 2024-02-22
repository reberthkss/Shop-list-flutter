import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../tools/interceptors/dio_interceptor.dart';

@module
abstract class NoAuthNetworkModule {
  @Named("NoAuthDio")
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: baseUrl,
          headers: {
            "content-type": "application/json",
            "accept-encoding": null
          },
        ),
      )..interceptors.add(
          LoggerInterceptor(),
        );
}

const String baseUrl = "http://192.168.0.9:3000";
