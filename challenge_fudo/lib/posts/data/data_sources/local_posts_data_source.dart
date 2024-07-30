import 'package:challenge_fudo/posts/data/models/post_model.dart';
import 'package:challenge_fudo/posts/data/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class LocalPostsDataSource {
  Future<List<PostModel>> getPosts();
  Future<List<UserModel>> getUsers();
  Future<void> insertPost(PostModel post);
  Future<void> insertUser(UserModel user);
  Future<void> deletePosts();
  Future<void> deleteUsers();
}

class LocalPostsDataSourceImpl implements LocalPostsDataSource {
  final Database database;

  LocalPostsDataSourceImpl({required this.database});

  @override
  Future<List<PostModel>> getPosts() async {
    final List<Map<String, Object?>> postsMaps = await database.query('posts');

    return [
      for (final {
            'id': id as int,
            'userId': userId as int,
            'title': title as String,
            'body': body as String,
          } in postsMaps)
        PostModel(id: id, userId: userId, title: title, body: body)
    ];
  }

  @override
  Future<List<UserModel>> getUsers() async {
    final List<Map<String, Object?>> usersMaps = await database.query('users');

    return [
      for (final {
            'id': id as int,
            'name': name as String,
          } in usersMaps)
        UserModel(id: id, name: name)
    ];
  }

  @override
  Future<void> insertPost(PostModel post) async {
    await database.insert(
      'posts',
      post.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> insertUser(UserModel user) async {
    await database.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> deletePosts() async {
    await database.delete('posts');
  }

  @override
  Future<void> deleteUsers() async {
    await database.delete('users');
  }
}
