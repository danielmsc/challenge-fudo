import 'package:challenge_fudo/core/domain/entities/failures.dart';
import 'package:dartz/dartz.dart';

abstract class LocalRepository {
  Future<Either<Failure, bool?>> getLoginStatus();
  Future<Either<Failure, void>> setLoginStatus(bool isAuthenticated);
}
