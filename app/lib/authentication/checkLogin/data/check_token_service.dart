import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../domain/check_token_request.dart';

abstract class CheckTokenService {
  Future<void> checkToken(CheckTokenRequest request);
}

@Injectable(as: CheckTokenService)
class CheckTokenServiceImpl extends CheckTokenService {
  CheckTokenServiceImpl(this.dio);

  final Dio dio;

  @override
  Future<void> checkToken(CheckTokenRequest request) {
    return dio.post(
      "/login/confirm",
      data: {"username": request.username, "confirmationCode": request.otp},
      options: Options(
        contentType: "application/json",
        responseType: ResponseType.json,
      ),
    );
  }
}
