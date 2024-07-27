import 'package:challenge_fudo/core/data/network/dio_client.dart';
import 'package:challenge_fudo/posts/data/data_sources/posts_data_source.dart';
import 'package:challenge_fudo/posts/data/repositories/posts_repository_impl.dart';
import 'package:challenge_fudo/posts/domain/repositories/posts_repository.dart';
import 'package:get/get.dart';

class DependencyInjector {
  static createPostsRepository() {
    try {
      return Get.find<PostsRepository>();
    } catch (_) {
      final PostsDataSource dataSource =
          Get.put(PostsDataSourceImpl(client: Get.find<DioClient>()));
      Get.put<PostsRepository>(PostsRepositoryImpl(dataSource: dataSource));
    }
  }
}
