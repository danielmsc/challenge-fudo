import 'package:challenge_fudo/core/presentation/pages/routes.dart';
import 'package:challenge_fudo/posts/domain/entities/post.dart';
import 'package:challenge_fudo/posts/domain/entities/user.dart';
import 'package:challenge_fudo/posts/domain/use_cases/get_local_posts.dart';
import 'package:challenge_fudo/posts/domain/use_cases/get_local_users.dart';
import 'package:challenge_fudo/posts/domain/use_cases/get_posts.dart';
import 'package:challenge_fudo/posts/domain/use_cases/get_users.dart';
import 'package:challenge_fudo/posts/domain/use_cases/insert_post.dart';
import 'package:challenge_fudo/posts/domain/use_cases/insert_user.dart';
import 'package:get/get.dart';

class PostsController extends GetxController with StateMixin {
  List<Post> posts = [];
  List<User> users = [];

  final _filteredPosts = <Post>[].obs;
  List<Post> get filteredPosts => _filteredPosts;

  final GetPosts getPostsUseCase;
  final GetUsers getUsersUseCase;
  final GetLocalPosts getLocalPostsUseCase;
  final GetLocalUsers getLocalUsersUseCase;
  final InsertPost insertPostUseCase;
  final InsertUser insertUserUseCase;

  PostsController({
    required this.getPostsUseCase,
    required this.getUsersUseCase,
    required this.getLocalPostsUseCase,
    required this.getLocalUsersUseCase,
    required this.insertPostUseCase,
    required this.insertUserUseCase,
  });

  @override
  Future<void> onInit() async {
    await getInformation();
    super.onInit();
  }

  Future<void> getInformation() async {
    change(null, status: RxStatus.loading());
    await getPosts();
    await getUsers();
  }

  Future<void> getPosts() async {
    final result = await getPostsUseCase(NoParamsGetPosts());
    result.fold((l) async {
      l.showError();
      await _getLocalPosts();
    }, (r) async {
      posts = r;
      _filteredPosts.value = List.from(r);
      await _insertPosts();
    });
  }

  Future<void> getUsers() async {
    final result = await getUsersUseCase(NoParamsGetUsers());
    result.fold((l) async {
      l.showError();
      await _getLocalUsers();
    }, (r) async {
      users = r;
      await _insertUsers();
    });

    if (users.isEmpty) {
      change(null, status: RxStatus.empty());
    } else {
      change(null, status: RxStatus.success());
    }
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

  Future<void> goToCreatePostPage() async =>
      await Get.toNamed(Routes.createPostPage);

  Future<void> _getLocalPosts() async {
    final result = await getLocalPostsUseCase(NoParamsGetLocalPosts());

    result.fold((l) => null, (r) {
      posts = r;
      _filteredPosts.value = List.from(r);
    });
  }

  Future<void> _insertPosts() async {
    for (Post post in posts) {
      await insertPostUseCase(
        InsertPostParams(
            id: post.id!,
            userId: post.userId,
            title: post.title,
            body: post.body),
      );
    }
  }

  Future<void> _getLocalUsers() async {
    final result = await getLocalUsersUseCase(NoParamsGetLocalUsers());

    result.fold((l) => null, (r) {
      users = r;
    });
  }

  Future<void> _insertUsers() async {
    for (User user in users) {
      await insertUserUseCase(
        InsertUserParams(
          id: user.id,
          name: user.name,
        ),
      );
    }
  }
}
