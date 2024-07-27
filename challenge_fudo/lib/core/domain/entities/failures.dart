import 'package:fluttertoast/fluttertoast.dart';

abstract class Failure {
  showError();
}

class NetworkFailure extends Failure {
  @override
  showError() {
    Fluttertoast.showToast(msg: 'No hay conexión a internet');
  }
}

class TimeoutFailure extends Failure {
  @override
  showError() {
    Fluttertoast.showToast(msg: 'Error de timeout');
  }
}

class InvalidCredentialsFailure extends Failure {
  @override
  showError() {
    Fluttertoast.showToast(msg: 'Las credenciales son inválidas');
  }
}
