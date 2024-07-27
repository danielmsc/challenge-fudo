import 'package:challenge_fudo/core/data/data_sources/local_data_source.dart';
import 'package:challenge_fudo/core/data/network/dio_client.dart';
import 'package:challenge_fudo/core/data/repositories/local_repository_impl.dart';
import 'package:challenge_fudo/core/domain/repositories/local_repository.dart';
import 'package:challenge_fudo/login/data/data_sources/login_data_source.dart';
import 'package:challenge_fudo/login/data/repositories/login_repository_impl.dart';
import 'package:challenge_fudo/login/domain/repositories/login_repository.dart';
import 'package:challenge_fudo/posts/data/data_sources/posts_data_source.dart';
import 'package:challenge_fudo/posts/data/repositories/posts_repository_impl.dart';
import 'package:challenge_fudo/posts/domain/repositories/posts_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DependencyInjector {
  static createPostsRepository() {
    try {
      return Get.find<PostsRepository>();
    } catch (_) {
      final dataSource =
          Get.put(PostsDataSourceImpl(client: Get.find<DioClient>()));
      Get.put<PostsRepository>(PostsRepositoryImpl(dataSource: dataSource));
    }
  }

  static createLoginRepository() {
    try {
      return Get.find<LoginRepository>();
    } catch (_) {
      final dataSource = Get.put(LoginDataSourceImpl());
      Get.put<LoginRepository>(LoginRepositoryImpl(dataSource: dataSource));
    }
  }

  static createLocalRepository() {
    try {
      return Get.find<LocalRepository>();
    } catch (_) {
      final dataSource =
          Get.put(LocalDataSourceImpl(prefs: Get.find<SharedPreferences>()));
      Get.put<LocalRepository>(LocalRepositoryImpl(dataSource: dataSource));
    }
  }
}
