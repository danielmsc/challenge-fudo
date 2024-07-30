import 'package:challenge_fudo/core/utils/dependency_injector.dart';
import 'package:challenge_fudo/posts/domain/use_cases/create_post.dart';
import 'package:challenge_fudo/posts/presentation/controllers/create_post_controller.dart';
import 'package:get/get.dart';

class CreatePostBindings extends Bindings {
  @override
  void dependencies() {
    final createPostUseCase =
        CreatePost(repository: DependencyInjector.createPostsRepository());

    Get.put<CreatePostController>(
        CreatePostController(createPostUseCase: createPostUseCase));
  }
}
