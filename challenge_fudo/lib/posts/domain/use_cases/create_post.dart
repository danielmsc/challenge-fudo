import 'package:challenge_fudo/core/domain/entities/failures.dart';
import 'package:challenge_fudo/core/domain/use_cases/use_case.dart';
import 'package:challenge_fudo/posts/data/models/post_model.dart';
import 'package:challenge_fudo/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class CreatePost extends UseCase<bool, CreatePostParams> {
  final PostsRepository repository;

  CreatePost({required this.repository});

  @override
  Future<Either<Failure, bool>> call(CreatePostParams params) async {
    return await repository.createPost(PostModel(
        userId: params.userId, title: params.title, body: params.body));
  }
}

class CreatePostParams {
  final String title;
  final String body;
  final int userId;

  CreatePostParams(
      {required this.title, required this.body, required this.userId});
}
