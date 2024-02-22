import 'dart:io';

import 'package:app/authentication/tools/token_preferences.dart';
import 'package:app/main.dart';
import 'package:app/route/route_list.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class RefreshTokenInterceptor extends Interceptor {
  const RefreshTokenInterceptor(this._routeList, this._tokenPreferences);

  final RouteList _routeList;
  final TokenPreferences _tokenPreferences;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    try {
      if (err.response?.statusCode == HttpStatus.unauthorized) {
        _tokenPreferences.saveAccessToken("");
        goRouter.go(_routeList.authenticationList.login);
      }
    } catch (_) {}
    super.onError(err, handler);
  }
}
