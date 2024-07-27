import 'package:challenge_fudo/login/presentation/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: _Content(controller: controller),
    );
  }
}

class _Content extends StatelessWidget {
  final LoginController controller;

  const _Content({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.userTextController,
            validator: (value) => controller.validateUser(value),
          ),
          TextFormField(
            obscureText: true,
            controller: controller.passTextController,
            validator: (value) => controller.validatePassword(value),
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
    );
  }
}
