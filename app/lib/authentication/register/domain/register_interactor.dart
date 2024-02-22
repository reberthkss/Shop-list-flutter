import 'package:app/authentication/register/domain/register_payload.dart';
import 'package:injectable/injectable.dart';

import '../data/register_repository.dart';

abstract class RegisterInteractor {
  Future<void> register(RegisterPayload payload);
}

@Injectable(as: RegisterInteractor)
class RegisterInteractorImp extends RegisterInteractor {
  RegisterInteractorImp(
    this.repository,
  );

  final RegisterRepository repository;

  @override
  Future<void> register(RegisterPayload payload) {
    return repository.register(payload);
  }

}