final class ApplicationException implements Exception {
  final String message;
  ApplicationException(this.message);

  @override
  String toString() => message;
}
