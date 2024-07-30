import 'package:challenge_fudo/core/presentation/pages/routes.dart';
import 'package:challenge_fudo/login/domain/use_cases/login.dart';
import 'package:challenge_fudo/login/domain/use_cases/set_authentication_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final userTextController = TextEditingController();
  final passTextController = TextEditingController();
  final Login loginUseCase;
  final SetAuthenticationStatus setAuthenticationStatusUseCase;

  LoginController({
    required this.loginUseCase,
    required this.setAuthenticationStatusUseCase,
  });

  String? validateUser(String? value) {
    if (value != null) {
      if (value.isNotEmpty && !value.isBlank!) {
        return null;
      }
    }
    return 'El campo es inválido';
  }

  String? validatePassword(String? value) {
    if (value != null) {
      if (value.isNotEmpty && !value.isBlank!) {
        return null;
      }
    }
    return 'El campo es inválido';
  }

  bool validateForm() => formKey.currentState!.validate();

  Future<void> login() async {
    final result = await loginUseCase(LoginParams(
        user: userTextController.text, pass: passTextController.text));

    result.fold((l) => l.showError(), (r) async {
      setAuthenticationStatusUseCase(
          SetAuthenticationStatusParams(state: true));
      await Get.offAllNamed(Routes.postsPage);
    });
  }

  @override
  void dispose() {
    userTextController.dispose();
    passTextController.dispose();
    super.dispose();
  }
}
