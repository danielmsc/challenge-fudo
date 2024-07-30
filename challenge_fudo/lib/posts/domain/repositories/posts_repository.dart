import 'package:challenge_fudo/core/domain/entities/failures.dart';
import 'package:challenge_fudo/posts/data/models/post_model.dart';
import 'package:challenge_fudo/posts/domain/entities/post.dart';
import 'package:challenge_fudo/posts/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class PostsRepository {
  Future<Either<Failure, List<Post>>> getPosts();
  Future<Either<Failure, List<User>>> getUsers();
  Future<Either<Failure, bool>> createPost(PostModel post);
}
