import 'package:challenge_fudo/core/domain/entities/failures.dart';
import 'package:challenge_fudo/core/domain/use_cases/use_case.dart';
import 'package:challenge_fudo/posts/domain/entities/user.dart';
import 'package:challenge_fudo/posts/domain/repositories/local_posts_repository.dart';
import 'package:dartz/dartz.dart';

class GetLocalUsers extends UseCase<List<User>, NoParamsGetLocalUsers> {
  final LocalPostsRepository repository;

  GetLocalUsers({required this.repository});

  @override
  Future<Either<Failure, List<User>>> call(NoParamsGetLocalUsers params) async {
    return await repository.getUsers();
  }
}

class NoParamsGetLocalUsers {}
