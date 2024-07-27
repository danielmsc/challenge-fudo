import 'package:challenge_fudo/posts/domain/use_cases/create_post.dart';
import 'package:get/get.dart';

class CreatePostController extends GetxController {
  final CreatePost createPostUseCase;

  CreatePostController({required this.createPostUseCase});
}
