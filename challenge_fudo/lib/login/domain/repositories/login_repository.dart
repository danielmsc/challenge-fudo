import 'package:challenge_fudo/core/domain/entities/failures.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<Failure, bool>> login(String user, String pass);
}
