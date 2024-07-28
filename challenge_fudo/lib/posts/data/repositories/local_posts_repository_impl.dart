import 'package:challenge_fudo/core/domain/api_network.dart';
import 'package:challenge_fudo/core/domain/entities/failures.dart';
import 'package:challenge_fudo/posts/data/data_sources/local_posts_data_source.dart';
import 'package:challenge_fudo/posts/data/models/post_model.dart';
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
  Future<Either<Failure, void>> insertPost(PostModel post) async {
    return await ApiNetwork.call(() async => await dataSource.insertPost(post));
  }
}
