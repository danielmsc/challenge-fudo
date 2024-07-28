import 'package:challenge_fudo/core/domain/entities/failures.dart';
import 'package:challenge_fudo/core/domain/use_cases/use_case.dart';
import 'package:challenge_fudo/posts/data/models/user_model.dart';
import 'package:challenge_fudo/posts/domain/repositories/local_posts_repository.dart';
import 'package:dartz/dartz.dart';

class InsertUser extends UseCase<void, InsertUserParams> {
  final LocalPostsRepository repository;

  InsertUser({required this.repository});

  @override
  Future<Either<Failure, void>> call(InsertUserParams params) async {
    return await repository
        .insertUser(UserModel(id: params.id, name: params.name));
  }
}

class InsertUserParams {
  final int id;
  final String name;

  InsertUserParams({required this.id, required this.name});
}
