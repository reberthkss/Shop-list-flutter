import 'package:shop_list/di/injection.dart';
import 'package:shop_list/tools/interceptors/access_token_interceptor.dart';
import 'package:shop_list/tools/interceptors/refresh_token_interceptor.dart';
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


const String baseUrl = "http://shoplist-api.dialogy.studio";