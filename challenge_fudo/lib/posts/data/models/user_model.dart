import 'package:challenge_fudo/posts/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.id, required super.name});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(id: json['id'], name: json['name']);

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
