import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheHelper {
  static late FlutterSecureStorage secureStorage;

  //!  init of cache
  static Future<void> init() async {
    secureStorage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  //! this method for put data in local database
  Future<void> saveData(String key, dynamic value) async {
    await secureStorage.write(key: key, value: value.toString());
  }

  //! get data already saved in local database
  Future<String?> getData(String key) async {
    return await secureStorage.read(key: key);
  }

  //! remove data from local database

  Future<void> removeData(String key) async {
    return await secureStorage.delete(key: key);
  }

  //!check  if key in local database

  Future<bool> containKey(String key) async {
    return await secureStorage.containsKey(key: key);
  }

  //! clear all data in local
  Future<void> clearData() async {
    return await secureStorage.deleteAll();
  }
}
