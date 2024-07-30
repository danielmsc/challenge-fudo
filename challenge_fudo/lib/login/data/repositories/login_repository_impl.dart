import 'package:challenge_fudo/core/domain/api_network.dart';
import 'package:challenge_fudo/core/domain/entities/failures.dart';
import 'package:challenge_fudo/login/data/data_sources/login_data_source.dart';
import 'package:challenge_fudo/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource dataSource;

  LoginRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, bool>> login(String user, String pass) async {
    return ApiNetwork.call<bool>(
        () async => await dataSource.login(user, pass));
  }
}
