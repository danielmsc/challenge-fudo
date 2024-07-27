import 'package:challenge_fudo/core/data/network/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  Future<Dio> _getDioClient() async {
    final options = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    );

    final dio = Dio(options);

    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
        ),
      );
    }

    return dio;
  }

  Future<Response<dynamic>> get(String path) async {
    try {
      if (!await InternetConnectionChecker().hasConnection) {
        throw NetworkException();
      }
      final dio = await _getDioClient();
      return await dio.get(path);
    } on DioException catch (e) {
      throw ExceptionUtils.getExceptionType(e);
    }
  }
}
