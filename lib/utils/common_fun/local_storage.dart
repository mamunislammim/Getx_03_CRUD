import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  final storage = FlutterSecureStorage();

  addData({required String key, required String value}) async {
    await storage.write(key: key, value: value);
    return;
  }

  Future<String> getData({required String key}) async {
   var data =  await storage.read(key: key) ?? "";
    return data ;
  }

  deleteData({required String key}) async {
    await storage.delete(key: key);
    return;
  }

  deleteAllData({required String key}) async {
    await storage.deleteAll();
    return;
  }
}
