import 'package:challenge_fudo/core/data/network/exceptions.dart';
import 'package:challenge_fudo/core/domain/entities/failures.dart';
import 'package:dartz/dartz.dart';

class ApiNetwork {
  static Future<Either<Failure, T>> call<T>(Function() function) async {
    try {
      T result = await function();
      return Right(result);
    } on NetworkException {
      return Left(NetworkFailure());
    } on TimeoutException {
      return Left(TimeoutFailure());
    }
  }
}
