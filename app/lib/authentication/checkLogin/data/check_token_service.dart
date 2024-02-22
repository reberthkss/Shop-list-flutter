import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../domain/check_token_request.dart';

abstract class CheckTokenService {
  Future<String> checkToken(CheckTokenRequest request);
}

@Injectable(as: CheckTokenService)
class CheckTokenServiceImpl extends CheckTokenService {
  CheckTokenServiceImpl(this.dio);

  final Dio dio;

  @override
  Future<String> checkToken(CheckTokenRequest request) async {
    final response = await dio.post(
      request.url,
      data: {"username": request.username, "confirmationCode": request.otp},
      options: Options(
        contentType: "application/json",
        responseType: ResponseType.json,
      ),
    );
     return jsonDecode(response.data);
  }
}
