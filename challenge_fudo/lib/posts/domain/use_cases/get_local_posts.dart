import 'package:challenge_fudo/core/domain/entities/failures.dart';
import 'package:challenge_fudo/core/domain/use_cases/use_case.dart';
import 'package:challenge_fudo/posts/domain/entities/post.dart';
import 'package:challenge_fudo/posts/domain/repositories/local_posts_repository.dart';
import 'package:dartz/dartz.dart';

class GetLocalPosts extends UseCase<List<Post>, NoParamsGetLocalPosts> {
  final LocalPostsRepository repository;

  GetLocalPosts({required this.repository});

  @override
  Future<Either<Failure, List<Post>>> call(NoParamsGetLocalPosts params) async {
    return await repository.getPosts();
  }
}

class NoParamsGetLocalPosts {}
