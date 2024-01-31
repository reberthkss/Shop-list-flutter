import 'package:app/authentication/login/data/service/sign_in_service.dart';
import 'package:injectable/injectable.dart';

import '../domain/model/sign_in_request.dart';

abstract class SignInRepository {
  Future<void> doSignIn(SignInRequest request);
}

@Injectable(as: SignInRepository)
class SignInRepositoryImpl implements SignInRepository {
  const SignInRepositoryImpl(
    this.service,
  );

  final SignInService service;

  @override
  Future<void> doSignIn(SignInRequest request) {
    return service.doSignIn(
      request,
    );
  }
}
