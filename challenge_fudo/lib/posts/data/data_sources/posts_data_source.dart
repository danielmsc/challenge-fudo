import 'package:challenge_fudo/core/data/network/dio_client.dart';
import 'package:challenge_fudo/posts/data/models/post_model.dart';
import 'package:challenge_fudo/posts/data/models/user_model.dart';

abstract class PostsDataSource {
  Future<List<PostModel>> getPosts();
  Future<List<UserModel>> getUsers();
}

class PostsDataSourceImpl implements PostsDataSource {
  final DioClient client;

  PostsDataSourceImpl({required this.client});

  @override
  Future<List<PostModel>> getPosts() async {
    final result = await client.get('/posts');
    return (result as List).map((e) => PostModel.fromJson(e)).toList();
  }

  @override
  Future<List<UserModel>> getUsers() async {
    final result = await client.get('/users');
    return (result as List).map((e) => UserModel.fromJson(e)).toList();
  }
}
