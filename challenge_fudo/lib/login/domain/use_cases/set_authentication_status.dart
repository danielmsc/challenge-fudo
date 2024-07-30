import 'package:challenge_fudo/core/domain/entities/failures.dart';
import 'package:challenge_fudo/core/domain/repositories/local_repository.dart';
import 'package:challenge_fudo/core/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class SetAuthenticationStatus
    extends UseCase<void, SetAuthenticationStatusParams> {
  final LocalRepository repository;

  SetAuthenticationStatus({required this.repository});

  @override
  Future<Either<Failure, void>> call(params) async {
    return await repository.setLoginStatus(params.state);
  }
}

class SetAuthenticationStatusParams {
  final bool state;

  SetAuthenticationStatusParams({required this.state});
}
