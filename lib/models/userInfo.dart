// ignore: file_names
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserDetails {
  late String authInfo;

  storeData(authInfo) async {
    final storage = new FlutterSecureStorage();

// Write value
    await storage.write(key: 'jwt', value: authInfo);
  }
}

class UserSignInfo {
  final String name;
  final String email;
  final String password;
  // final String dob;
  // final String gender;

  UserSignInfo(this.name, this.email, this.password);
}

class UserLogInfo {
  final String email;
  final String password;
  // final String dob;
  // final String gender;

  UserLogInfo(this.email, this.password);
}
