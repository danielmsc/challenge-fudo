import 'package:challenge_fudo/core/data/data_sources/local_data_source.dart';
import 'package:challenge_fudo/core/domain/entities/failures.dart';
import 'package:challenge_fudo/core/domain/repositories/local_repository.dart';
import 'package:dartz/dartz.dart';

class LocalRepositoryImpl extends LocalRepository {
  final LocalDataSource dataSource;

  LocalRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, bool?>> getLoginStatus() async {
    return Right(await dataSource.getLoginStatus());
  }

  @override
  Future<Either<Failure, void>> setLoginStatus(bool isAuthenticated) async {
    return Right(await dataSource.setLoginStatus(isAuthenticated));
  }
}
