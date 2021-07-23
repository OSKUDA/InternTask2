import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  final storage = FlutterSecureStorage();

  Future<void> storeUserCredential(
      {required String name,
      required String password,
      required String email,
      required String phone,
      required String profession}) async {
    await storage.write(key: name, value: password);
    // suffix name with key data identifier
    await storage.write(key: '$name+email', value: email);
    await storage.write(key: '$name+phone', value: phone);
    await storage.write(key: '$name+profession', value: profession);
  }

  Future<bool> readAndVerifyUserCredential(
      {required String name, required String password}) async {
    String? value = await storage.read(key: name);
    if (value == null) {
      return false;
    } else if (value == password) {
      return true;
    } else {
      return false;
    }
  }
}
