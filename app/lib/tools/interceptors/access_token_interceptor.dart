import 'package:shop_list/authentication/tools/token_preferences.dart';
import 'package:shop_list/tools/shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class AccessTokenInterceptor extends Interceptor {
AccessTokenInterceptor(
  this.tokenPreferences,
);

  final TokenPreferences tokenPreferences;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await tokenPreferences.getAccessToken();

    options.headers["Authorization"] = accessToken;

    super.onRequest(options, handler);
  }
}

