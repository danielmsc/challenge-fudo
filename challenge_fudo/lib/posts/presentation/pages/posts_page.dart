import 'package:challenge_fudo/posts/presentation/controllers/posts_controller.dart';
import 'package:challenge_fudo/posts/presentation/widgets/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsPage extends GetView<PostsController> {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Posts')),
      body: controller.obx(
        onLoading: const Center(child: CircularProgressIndicator()),
        (_) => _Content(controller: controller),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async => await controller.goToCreatePostPage(),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final PostsController controller;

  const _Content({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: SearchBar(
              hintText: 'Buscar por usuario...',
              onChanged: (value) => controller.onSearchBarChanged(value),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.filteredPosts.length,
                itemBuilder: (context, index) => PostTile(
                  title: controller.filteredPosts[index].title,
                  body: controller.filteredPosts[index].body,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
