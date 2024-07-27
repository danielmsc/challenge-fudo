import 'package:challenge_fudo/core/presentation/pages/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  runApp(const MainApp());
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
