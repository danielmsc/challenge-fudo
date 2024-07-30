import 'package:challenge_fudo/core/domain/entities/failures.dart';
import 'package:challenge_fudo/core/domain/use_cases/use_case.dart';
import 'package:challenge_fudo/posts/domain/repositories/local_posts_repository.dart';
import 'package:dartz/dartz.dart';

class DeletePosts extends UseCase<void, NoParamsDeletePosts> {
  final LocalPostsRepository repository;

  DeletePosts({required this.repository});

  @override
  Future<Either<Failure, void>> call(NoParamsDeletePosts params) async {
    return await repository.deletePosts();
  }
}

class NoParamsDeletePosts {}
