import 'package:injectable/injectable.dart';

import '../data/check_token_repository.dart';
import 'check_token_request.dart';

abstract class CheckTokenInteractor {
  Future<String> checkToken(
    CheckTokenRequest request
  );
}

@Injectable(as: CheckTokenInteractor)
class CheckTokenInteractorImpl extends CheckTokenInteractor {
  CheckTokenInteractorImpl(
    this.repository,
  );

  final CheckTokenRepository repository;

  @override
  Future<String> checkToken(CheckTokenRequest request) {
    return repository.checkToken(request);
  }

}