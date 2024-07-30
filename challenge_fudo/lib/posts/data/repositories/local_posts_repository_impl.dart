import 'package:challenge_fudo/core/domain/api_network.dart';
import 'package:challenge_fudo/core/domain/entities/failures.dart';
import 'package:challenge_fudo/posts/data/data_sources/local_posts_data_source.dart';
import 'package:challenge_fudo/posts/data/models/post_model.dart';
import 'package:challenge_fudo/posts/data/models/user_model.dart';
import 'package:challenge_fudo/posts/domain/repositories/local_posts_repository.dart';
import 'package:dartz/dartz.dart';

class LocalPostsRepositoryImpl implements LocalPostsRepository {
  final LocalPostsDataSource dataSource;

  LocalPostsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<PostModel>>> getPosts() async {
    return await ApiNetwork.call(() async => await dataSource.getPosts());
  }

  @override
  Future<Either<Failure, List<UserModel>>> getUsers() async {
    return await ApiNetwork.call(() async => await dataSource.getUsers());
  }

  @override
  Future<Either<Failure, void>> insertPost(PostModel post) async {
    return await ApiNetwork.call(() async => await dataSource.insertPost(post));
  }

  @override
  Future<Either<Failure, void>> insertUser(UserModel user) async {
    return await ApiNetwork.call(() async => await dataSource.insertUser(user));
  }

  @override
  Future<Either<Failure, void>> deletePosts() async {
    return await ApiNetwork.call(() async => await dataSource.deletePosts());
  }

  @override
  Future<Either<Failure, void>> deleteUsers() async {
    return await ApiNetwork.call(() async => await dataSource.deleteUsers());
  }
}
