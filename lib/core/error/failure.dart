abstract class Failure {
  final String? error;

  Failure({this.error});

  String get message => error ?? toString();

  void showSnackBar() {
    print(error);
  }
}
