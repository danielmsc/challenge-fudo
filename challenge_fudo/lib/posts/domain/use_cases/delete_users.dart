import 'package:challenge_fudo/core/domain/entities/failures.dart';
import 'package:challenge_fudo/core/domain/use_cases/use_case.dart';
import 'package:challenge_fudo/posts/domain/repositories/local_posts_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteUsers extends UseCase<void, NoParamsDeleteUsers> {
  final LocalPostsRepository repository;

  DeleteUsers({required this.repository});

  @override
  Future<Either<Failure, void>> call(NoParamsDeleteUsers params) async {
    return await repository.deleteUsers();
  }
}

class NoParamsDeleteUsers {}
