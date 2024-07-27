import 'package:dio/dio.dart';

class NetworkException implements Exception {}

class TimeoutException implements Exception {}

class ExceptionUtils {
  static Exception getExceptionType(DioException exception) {
    if (exception.type == DioExceptionType.connectionTimeout ||
        exception.type == DioExceptionType.sendTimeout ||
        exception.type == DioExceptionType.receiveTimeout) {
      return TimeoutException();
    }
    return NetworkException();
  }
}
