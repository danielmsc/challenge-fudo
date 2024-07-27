import 'package:fluttertoast/fluttertoast.dart';

abstract class Failure {
  showError();
}

class NetworkFailure extends Failure {
  @override
  showError() {
    // TODO: implement showError
    throw UnimplementedError();
  }
}

class TimeoutFailure extends Failure {
  @override
  showError() {
    // TODO: implement showError
    throw UnimplementedError();
  }
}

class InvalidCredentialsFailure extends Failure {
  @override
  showError() {
    Fluttertoast.showToast(msg: 'Las credenciales son inválidas');
  }
}
