import 'package:challenge_fudo/login/presentation/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Login')),
      body: _Content(controller: controller),
    );
  }
}

class _Content extends StatelessWidget {
  final LoginController controller;

  const _Content({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller.userTextController,
              validator: (value) => controller.validateUser(value),
              decoration: const InputDecoration(hintText: 'Usuario'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 32.0),
              child: TextFormField(
                obscureText: true,
                controller: controller.passTextController,
                validator: (value) => controller.validatePassword(value),
                decoration: const InputDecoration(hintText: 'Contraseña'),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (controller.validateForm()) {
                  await controller.login();
                }
              },
              child: const Text('Ingresar'),
            ),
          ],
        ),
      ),
    );
  }
}
