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
