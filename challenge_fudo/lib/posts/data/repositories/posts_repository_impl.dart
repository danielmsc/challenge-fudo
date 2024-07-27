import 'package:challenge_fudo/core/domain/api_network.dart';
import 'package:challenge_fudo/core/domain/entities/failures.dart';
import 'package:challenge_fudo/posts/data/data_sources/posts_data_source.dart';
import 'package:challenge_fudo/posts/data/models/post_model.dart';
import 'package:challenge_fudo/posts/domain/entities/post.dart';
import 'package:challenge_fudo/posts/domain/entities/user.dart';
import 'package:challenge_fudo/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class PostsRepositoryImpl implements PostsRepository {
  final PostsDataSource dataSource;

  PostsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<Post>>> getPosts() async {
    return ApiNetwork.call<List<Post>>(() async => await dataSource.getPosts());
  }

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    return ApiNetwork.call<List<User>>(() async => await dataSource.getUsers());
  }

  @override
  Future<Either<Failure, bool>> createPost(PostModel post) async {
    return ApiNetwork.call<bool>(() async => await dataSource.createPost(post));
  }
}
