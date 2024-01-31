import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/sign_in_request.dart';

abstract class SignInService {
  Future<void> doSignIn(SignInRequest request);
}

@Injectable(as: SignInService)
class SignInServiceImpl extends SignInService {
  SignInServiceImpl(
    @Named("NoAuthDio") this.dio,
  );

  final Dio dio;
  @override
  Future<void> doSignIn(SignInRequest request) {
    return dio.post(
      "/login",
      data: {
        "username": request.phoneNumber,
        "password": request.phoneNumber,
      },
    );
  }
}
