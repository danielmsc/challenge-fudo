import 'package:challenge_fudo/core/data/network/exceptions.dart';

abstract class LoginDataSource {
  Future<bool> login(String user, String pass);
}

class LoginDataSourceImpl implements LoginDataSource {
  @override
  Future<bool> login(String user, String pass) {
    // Hardcodeo la lógica
    if (user == 'challenge@fudo' && pass == 'password') {
      return Future.value(true);
    }
    throw InvalidCredentialsException();
  }
}
