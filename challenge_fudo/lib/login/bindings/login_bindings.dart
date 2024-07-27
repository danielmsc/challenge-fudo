import 'package:challenge_fudo/core/data/data_sources/local_data_source.dart';
import 'package:challenge_fudo/core/data/repositories/local_repository_impl.dart';
import 'package:challenge_fudo/core/domain/repositories/local_repository.dart';
import 'package:challenge_fudo/login/data/data_sources/login_data_source.dart';
import 'package:challenge_fudo/login/data/repositories/login_repository_impl.dart';
import 'package:challenge_fudo/login/domain/repositories/login_repository.dart';
import 'package:challenge_fudo/login/domain/use_cases/login.dart';
import 'package:challenge_fudo/login/domain/use_cases/set_authentication_status.dart';
import 'package:challenge_fudo/login/presentation/controllers/login_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    final loginDataSource = Get.put<LoginDataSource>(LoginDataSourceImpl());
    final loginRepository = Get.put<LoginRepository>(
        LoginRepositoryImpl(dataSource: loginDataSource));
    final loginUseCase = Login(repository: loginRepository);

    final localDataSource = Get.put<LocalDataSource>(
        LocalDataSourceImpl(prefs: Get.find<SharedPreferences>()));
    final localRepository = Get.put<LocalRepository>(
        LocalRepositoryImpl(dataSource: localDataSource));
    final setAuthenticationStatusUseCase =
        SetAuthenticationStatus(repository: localRepository);

    Get.lazyPut<LoginController>(
      () => LoginController(
        loginUseCase: loginUseCase,
        setAuthenticationStatusUseCase: setAuthenticationStatusUseCase,
      ),
    );
  }
}
