import 'package:challenge_fudo/posts/presentation/controllers/posts_controller.dart';
import 'package:get/get.dart';

class PostsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostsController>(() => PostsController());
  }
}
