import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ShopListSharedPreferences {
  Future<void> save<T>(String key, T value);
  Future<Object?> get(String key);
}

@Injectable(as: ShopListSharedPreferences)
class ShopListSharedPreferencesImpl implements ShopListSharedPreferences {
  @override
  Future<void> save<T>(String key, T value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    
    if (value is bool) {
      await prefs.setBool(key, value);
    }

    if (value is int) {
      await prefs.setInt(key, value);
    }

    if (value is double) {
      await prefs.setDouble(key, value);
    }

    if (value is String) {
      await prefs.setString(key, value);
    }

  }
  
  @override
  Future<Object?> get(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final value = prefs.get(key);
    return Future.value(value);
  }
  
}