import 'package:challenge_fudo/core/domain/entities/failures.dart';
import 'package:challenge_fudo/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';

abstract class LocalPostsRepository {
  Future<Either<Failure, void>> insertPost(PostModel post);
  Future<Either<Failure, List<PostModel>>> getPosts();
}
