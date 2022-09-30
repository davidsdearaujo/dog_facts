class Failure {
  final String code;
  final String? message;
  final StackTrace? stackTrace;
  final Object? exception;
  const Failure({
    required this.code,
    required this.message,
    this.stackTrace,
    this.exception,
  });
}
