class Failure implements Exception {
  Failure(this.message, {this.failureCode});

  final String message;
  final String? failureCode;

  @override
  String toString() => message;
}
