import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<bool?> getLoginStatus();
  Future<void> setLoginStatus(bool isAuthenticated);
}

const isAuthenticatedKey = 'isAuthenticated';

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences prefs;

  LocalDataSourceImpl({required this.prefs});

  @override
  Future<bool?> getLoginStatus() async {
    return prefs.getBool(isAuthenticatedKey);
  }

  @override
  Future<void> setLoginStatus(bool isAuthenticated) async {
    await prefs.setBool(isAuthenticatedKey, isAuthenticated);
  }
}
