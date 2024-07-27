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
    return const Text('crear');
  }
}
