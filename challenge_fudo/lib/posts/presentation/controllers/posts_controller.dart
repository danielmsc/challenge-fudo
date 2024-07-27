import 'package:challenge_fudo/posts/domain/entities/post.dart';
import 'package:challenge_fudo/posts/domain/entities/user.dart';
import 'package:challenge_fudo/posts/domain/use_cases/get_posts.dart';
import 'package:challenge_fudo/posts/domain/use_cases/get_users.dart';
import 'package:get/get.dart';

class PostsController extends GetxController with StateMixin {
  late List<Post> posts;
  late List<User> users;

  final _filteredPosts = <Post>[].obs;
  List<Post> get filteredPosts => _filteredPosts;

  final GetPosts getPostsUseCase;
  final GetUsers getUsersUseCase;

  PostsController(
      {required this.getPostsUseCase, required this.getUsersUseCase});

  @override
  void onInit() async {
    await getPosts();
    await getUsers();
    change(null, status: RxStatus.success());
    super.onInit();
  }

  Future<void> getPosts() async {
    final result = await getPostsUseCase(NoParamsGetPosts());
    result.fold((l) => l.showError(), (r) {
      posts = r;
      _filteredPosts.value = List.from(r);
    });
  }

  Future<void> getUsers() async {
    final result = await getUsersUseCase(NoParamsGetUsers());
    result.fold((l) => l.showError(), (r) {
      users = r;
    });
  }

  void onSearchBarChanged(String name) {
    if (name.isEmpty) {
      _filteredPosts.value = posts;
    } else {
      final user = users.firstWhereOrNull(
          (user) => user.name.toLowerCase() == name.toLowerCase());

      if (user != null) {
        _filteredPosts.value =
            List.from(posts.where((post) => post.userId == user.id));
      } else {
        _filteredPosts.value = posts;
      }
    }
  }
}
