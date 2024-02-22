import 'package:app/di/injection.dart';
import 'package:app/tools/interceptors/access_token_interceptor.dart';
import 'package:app/tools/interceptors/refresh_token_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../tools/interceptors/dio_interceptor.dart';


@module
abstract class NetworkModule {
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: baseUrl,
    )
  )..interceptors.addAll(
    [
      getIt.get<AccessTokenInterceptor>(),
      LoggerInterceptor(),
      getIt.get<RefreshTokenInterceptor>()
    ]
  )
  ;
}


const String baseUrl = "http://192.168.0.9:3000";