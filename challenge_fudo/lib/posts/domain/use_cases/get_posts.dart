import 'package:challenge_fudo/core/domain/entities/failures.dart';
import 'package:challenge_fudo/core/domain/use_cases/use_case.dart';
import 'package:challenge_fudo/posts/domain/entities/post.dart';
import 'package:challenge_fudo/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class GetPosts extends UseCase<List<Post>, NoParamsGetPosts> {
  final PostsRepository repository;

  GetPosts({required this.repository});

  @override
  Future<Either<Failure, List<Post>>> call(NoParamsGetPosts params) async {
    return await repository.getPosts();
  }
}

class NoParamsGetPosts {}
