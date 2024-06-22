import 'package:shop_list/authentication/register/data/register_service.dart';
import 'package:shop_list/authentication/register/domain/register_payload.dart';
import 'package:injectable/injectable.dart';

abstract class RegisterRepository {
  Future<void> register(RegisterPayload payload);
}

@Injectable(as: RegisterRepository)
class RegisterRepositoryImp extends RegisterRepository {
  RegisterRepositoryImp(
    this.service,
  );

  final RegisterService service;

  @override
  Future<void> register(RegisterPayload payload) {
    return service.register(payload);
  }

}