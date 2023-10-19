import 'package:shared_preferences/shared_preferences.dart';

enum StorageKeys {
  EMAIL;
}

abstract class LastEmail {
  static Future<void> setLastEmail(String value) async {
    await _setString(StorageKeys.EMAIL.toString(), value);
  }

  static Future<String> getLastEmail() async {
    return _getString(StorageKeys.EMAIL.toString());
  }

  static Future<void> _setString(String chave, String value) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.setString(chave, value);
  }

  static Future<String> _getString(String chave) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getString(chave) ?? "";
  }
}
