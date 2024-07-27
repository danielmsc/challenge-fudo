import 'package:challenge_fudo/posts/presentation/controllers/posts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsPage extends GetView<PostsController> {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: controller.obx(
        onLoading: const Center(child: CircularProgressIndicator()),
        (_) => _Content(controller: controller),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final PostsController controller;

  const _Content({required this.controller});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
