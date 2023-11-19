sealed class AuthException implements Exception {
  final String message;

  AuthException({required this.message});

  @override
  String toString() {
    return message;
  }
}

class AuthError extends AuthException {
  AuthError({required super.message});
}
