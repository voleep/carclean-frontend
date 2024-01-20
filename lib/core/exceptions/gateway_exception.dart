final class GatewayException implements Exception {
  final String message;
  GatewayException(this.message);

  @override
  String toString() => message;
}
