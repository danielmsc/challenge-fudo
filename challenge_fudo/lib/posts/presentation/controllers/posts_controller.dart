import 'package:challenge_fudo/posts/domain/entities/post.dart';
import 'package:challenge_fudo/posts/domain/entities/user.dart';
import 'package:challenge_fudo/posts/domain/use_cases/get_posts.dart';
import 'package:challenge_fudo/posts/domain/use_cases/get_users.dart';
import 'package:get/get.dart';

class PostsController extends GetxController with StateMixin {
  late List<Post> posts;
  final List<Post> filteredPosts = [];
  late List<User> users;
  final List<User> filteredUsers = [];

  final GetPosts getPostsUseCase;
  final GetUsers getUsersUseCase;

  PostsController(
      {required this.getPostsUseCase, required this.getUsersUseCase});

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }
}
