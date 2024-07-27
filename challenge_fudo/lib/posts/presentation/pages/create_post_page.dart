import 'package:challenge_fudo/posts/presentation/controllers/create_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePostPage extends GetView<CreatePostController> {
  const CreatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Crear post'),
      ),
      body: _Content(controller: controller),
    );
  }
}

class _Content extends StatelessWidget {
  final CreatePostController controller;

  const _Content({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.titleTextController,
              validator: (value) => controller.validateTitle(value),
              decoration: const InputDecoration(hintText: 'Título'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                controller: controller.bodyTextController,
                validator: (value) => controller.validateBody(value),
                decoration: const InputDecoration(hintText: 'Descripción'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: TextFormField(
                controller: controller.userIdTextController,
                validator: (value) => controller.validateUserId(value),
                decoration: const InputDecoration(hintText: 'Id de usuario'),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  if (controller.validateForm()) {
                    await controller.createPost();
                  }
                },
                child: const Text('Crear post'))
          ],
        ),
      ),
    );
  }
}
