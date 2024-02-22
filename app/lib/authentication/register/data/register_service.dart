import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../domain/register_payload.dart';

abstract class RegisterService {
  Future<void> register(RegisterPayload payload);
}

@Injectable(as: RegisterService)
class RegisterServiceImp extends RegisterService {
  RegisterServiceImp(
    @Named("NoAuthDio") this.dio,
  );

  final Dio dio;

  @override
  Future<void> register(RegisterPayload payload) async {
    await dio.post(
      "/register",
      data: {
        "name": payload.name,
        "lastname": payload.lastName,
        "username": payload.email,
        "phoneNumber": payload.phoneNumber,
        "password": payload.phoneNumber,
      },
      options: Options(
        headers: {
          'accept-encoding': '*;q=0'
        }
      )
    );

  }
}
