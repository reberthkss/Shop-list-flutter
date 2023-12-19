import 'package:injectable/injectable.dart';

abstract class LoginRepository {
  void makeLogin();
}

@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  @override
  void makeLogin() {
    return;
  }

}