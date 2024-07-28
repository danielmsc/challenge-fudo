import 'package:challenge_fudo/posts/data/models/post_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class LocalPostsDataSource {
  Future<List<PostModel>> getPosts();
  Future<void> insertPost(PostModel post);
}

class LocalPostsDataSourceImpl implements LocalPostsDataSource {
  final Database database;

  LocalPostsDataSourceImpl({required this.database});

  @override
  Future<List<PostModel>> getPosts() async {
    final List<Map<String, Object?>> postsMaps = await database.query('dogs');

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
  Future<void> insertPost(PostModel post) async {
    await database.insert(
      'posts',
      post.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
