import 'package:challenge_fudo/core/domain/entities/failures.dart';
import 'package:challenge_fudo/core/domain/use_cases/use_case.dart';
import 'package:challenge_fudo/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

class Login extends UseCase<bool, LoginParams> {
  final LoginRepository repository;

  Login({required this.repository});

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await repository.login(params.user, params.pass);
  }
}

class LoginParams {
  final String user;
  final String pass;

  LoginParams({required this.user, required this.pass});
}
