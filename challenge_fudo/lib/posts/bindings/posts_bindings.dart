import 'package:challenge_fudo/core/utils/dependency_injector.dart';
import 'package:challenge_fudo/login/domain/use_cases/set_authentication_status.dart';
import 'package:challenge_fudo/posts/domain/use_cases/delete_posts.dart';
import 'package:challenge_fudo/posts/domain/use_cases/delete_users.dart';
import 'package:challenge_fudo/posts/domain/use_cases/get_local_posts.dart';
import 'package:challenge_fudo/posts/domain/use_cases/get_local_users.dart';
import 'package:challenge_fudo/posts/domain/use_cases/get_posts.dart';
import 'package:challenge_fudo/posts/domain/use_cases/get_users.dart';
import 'package:challenge_fudo/posts/domain/use_cases/insert_post.dart';
import 'package:challenge_fudo/posts/domain/use_cases/insert_user.dart';
import 'package:challenge_fudo/posts/presentation/controllers/posts_controller.dart';
import 'package:get/get.dart';

class PostsBindings extends Bindings {
  final getPostsUseCase =
      GetPosts(repository: DependencyInjector.createPostsRepository());
  final getUsersUseCase =
      GetUsers(repository: DependencyInjector.createPostsRepository());
  final getLocalPostsUseCase = GetLocalPosts(
      repository: DependencyInjector.createLocalPostsRepository());
  final getLocalUsersUseCase = GetLocalUsers(
      repository: DependencyInjector.createLocalPostsRepository());
  final insertPostUseCase =
      InsertPost(repository: DependencyInjector.createLocalPostsRepository());
  final insertUserUseCase =
      InsertUser(repository: DependencyInjector.createLocalPostsRepository());
  final deletePostsUseCase =
      DeletePosts(repository: DependencyInjector.createLocalPostsRepository());
  final deleteUsersUseCase =
      DeleteUsers(repository: DependencyInjector.createLocalPostsRepository());
  final setAuthenticationStatusUseCase = SetAuthenticationStatus(
      repository: DependencyInjector.createLocalRepository());

  @override
  void dependencies() {
    Get.lazyPut<PostsController>(
      () => PostsController(
        getPostsUseCase: getPostsUseCase,
        getUsersUseCase: getUsersUseCase,
        getLocalPostsUseCase: getLocalPostsUseCase,
        getLocalUsersUseCase: getLocalUsersUseCase,
        insertPostUseCase: insertPostUseCase,
        insertUserUseCase: insertUserUseCase,
        deletePostsUseCase: deletePostsUseCase,
        deleteUsersUseCase: deleteUsersUseCase,
        setAuthenticationStatusUseCase: setAuthenticationStatusUseCase,
      ),
    );
  }
}
