import 'package:challenge_fudo/core/data/network/dio_client.dart';
import 'package:challenge_fudo/core/presentation/pages/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<SharedPreferences>(await SharedPreferences.getInstance(),
      permanent: true);
  Get.put<DioClient>(DioClient(), permanent: true);

  await initializeDatabase();

  runApp(const MainApp());
}

Future<void> initializeDatabase() async {
  final database = await openDatabase(
    join(await getDatabasesPath(), 'database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE posts(id INTEGER PRIMARY KEY, userId INTEGER, title TEXT, body TEXT)',
      );
    },
    version: 1,
  );

  Get.put<Database>(database, permanent: true);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: Pages.pages,
      //TODO parametrizar dependiendo si hizo login o no
      initialRoute: Routes.loginPage,
    );
  }
}
