import 'package:challenge_fudo/posts/domain/entities/post.dart';

class PostModel extends Post {
  PostModel(
      {required super.userId,
      required super.id,
      required super.title,
      required super.body});

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body']);
}
