import 'package:challenge_fudo/core/utils/dependency_injector.dart';
import 'package:challenge_fudo/posts/domain/use_cases/get_posts.dart';
import 'package:challenge_fudo/posts/domain/use_cases/get_users.dart';
import 'package:challenge_fudo/posts/presentation/controllers/posts_controller.dart';
import 'package:get/get.dart';

class PostsBindings extends Bindings {
  final getPostsUseCase =
      GetPosts(repository: DependencyInjector.createPostsRepository());
  final getUsersUseCase =
      GetUsers(repository: DependencyInjector.createPostsRepository());

  @override
  void dependencies() {
    Get.lazyPut<PostsController>(
      () => PostsController(
        getPostsUseCase: getPostsUseCase,
        getUsersUseCase: getUsersUseCase,
      ),
    );
  }
}
