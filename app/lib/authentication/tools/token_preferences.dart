import 'package:shop_list/tools/shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

abstract class TokenPreferences {
  Future<void> saveAccessToken(String accessToken);
  Future<String> getAccessToken();
}

@Injectable(as: TokenPreferences)
class TokenPreferencesImpl extends TokenPreferences {
  TokenPreferencesImpl(
    this.sharedPreferences
  );

  final ShopListSharedPreferences sharedPreferences;

  @override
  Future<String> getAccessToken() async {
    final result = await sharedPreferences.get(accessTokenKey);
    if (result is String) {
      return result;
    }
    return "";
  }

  @override
  Future<void> saveAccessToken(String accessToken) async {
   return sharedPreferences.save(accessTokenKey, accessToken);
  }

}



const accessTokenKey = "ACCESS_TOKEN";
