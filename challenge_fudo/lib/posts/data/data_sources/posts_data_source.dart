import 'package:challenge_fudo/core/data/network/dio_client.dart';
import 'package:challenge_fudo/posts/data/models/post_model.dart';
import 'package:challenge_fudo/posts/data/models/user_model.dart';

abstract class PostsDataSource {
  Future<List<PostModel>> getPosts();
  Future<List<UserModel>> getUsers();
  Future<bool> createPost(PostModel post);
}

class PostsDataSourceImpl implements PostsDataSource {
  final DioClient client;

  PostsDataSourceImpl({required this.client});

  @override
  Future<List<PostModel>> getPosts() async {
    final response = await client.get('/posts');
    return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
  }

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await client.get('/users');
    return (response.data as List).map((e) => UserModel.fromJson(e)).toList();
  }

  @override
  Future<bool> createPost(PostModel post) async {
    final response = await client.post('/posts',
        {'title': post.title, 'body': post.body, 'userId': post.userId});
    return response.statusCode == 201;
  }
}
