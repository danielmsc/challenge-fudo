import 'package:challenge_fudo/core/domain/entities/failures.dart';
import 'package:challenge_fudo/core/domain/use_cases/use_case.dart';
import 'package:challenge_fudo/posts/domain/entities/user.dart';
import 'package:challenge_fudo/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class GetUsers extends UseCase<List<User>, NoParamsGetUsers> {
  final PostsRepository repository;

  GetUsers({required this.repository});

  @override
  Future<Either<Failure, List<User>>> call(NoParamsGetUsers params) async {
    return await repository.getUsers();
  }
}

class NoParamsGetUsers {}
