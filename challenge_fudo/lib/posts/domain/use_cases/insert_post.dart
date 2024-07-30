import 'package:challenge_fudo/core/domain/entities/failures.dart';
import 'package:challenge_fudo/core/domain/use_cases/use_case.dart';
import 'package:challenge_fudo/posts/data/models/post_model.dart';
import 'package:challenge_fudo/posts/domain/repositories/local_posts_repository.dart';
import 'package:dartz/dartz.dart';

class InsertPost extends UseCase<void, InsertPostParams> {
  final LocalPostsRepository repository;

  InsertPost({required this.repository});

  @override
  Future<Either<Failure, void>> call(InsertPostParams params) async {
    return await repository.insertPost(PostModel(
        id: params.id,
        userId: params.userId,
        title: params.title,
        body: params.body));
  }
}

class InsertPostParams {
  final int id;
  final int userId;
  final String title;
  final String body;

  InsertPostParams(
      {required this.id,
      required this.userId,
      required this.title,
      required this.body});
}
