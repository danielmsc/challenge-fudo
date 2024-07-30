import 'package:challenge_fudo/core/utils/dependency_injector.dart';
import 'package:challenge_fudo/login/domain/use_cases/login.dart';
import 'package:challenge_fudo/login/domain/use_cases/set_authentication_status.dart';
import 'package:challenge_fudo/login/presentation/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    final loginUseCase =
        Login(repository: DependencyInjector.createLoginRepository());

    final setAuthenticationStatusUseCase = SetAuthenticationStatus(
        repository: DependencyInjector.createLocalRepository());

    Get.lazyPut<LoginController>(
      () => LoginController(
        loginUseCase: loginUseCase,
        setAuthenticationStatusUseCase: setAuthenticationStatusUseCase,
      ),
    );
  }
}
