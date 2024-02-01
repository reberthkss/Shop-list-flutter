import 'package:injectable/injectable.dart';

import '../domain/check_token_request.dart';
import 'check_token_service.dart';

abstract class CheckTokenRepository {
  Future<void> checkToken(CheckTokenRequest request);
}

@Injectable(as: CheckTokenRepository)
class CheckTokenRepositoryImpl extends CheckTokenRepository {
  CheckTokenRepositoryImpl(
    this.service,
  );

  final CheckTokenService service;
  @override
  Future<void> checkToken(CheckTokenRequest request) {
    return service.checkToken(request);
  }
}
