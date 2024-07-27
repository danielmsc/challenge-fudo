import 'package:challenge_fudo/login/bindings/login_bindings.dart';
import 'package:challenge_fudo/login/presentation/pages/login_page.dart';
import 'package:challenge_fudo/posts/bindings/posts_bindings.dart';
import 'package:challenge_fudo/posts/presentation/pages/posts_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {
  static const loginPage = '/loginPage';
  static const postsPage = '/postsPage';
}

class Pages {
  static final pages = [
    GetPage(
      name: Routes.loginPage,
      page: () => const LoginPage(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: Routes.postsPage,
      page: () => const PostsPage(),
      binding: PostsBindings(),
    ),
  ];
}
