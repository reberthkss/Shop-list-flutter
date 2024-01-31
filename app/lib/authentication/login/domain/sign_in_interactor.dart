import 'package:injectable/injectable.dart';

import '../data/sign_in_repository.dart';
import 'model/sign_in_request.dart';

abstract class SignInInteractor {
  Future<void> signIn(SignInRequest request);
}

@Injectable(as: SignInInteractor)
class SignInInteractorImpl extends SignInInteractor {
  SignInInteractorImpl(this.repository);

  final SignInRepository repository;

  @override
  Future<void> signIn(SignInRequest request) {
    return repository.doSignIn(
      request,
    );
  }
}
