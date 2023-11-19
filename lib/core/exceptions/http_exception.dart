sealed class HttpException implements Exception {
  final String message;
  HttpException({required this.message});

  @override
  String toString() => message;
}

class HttpConnectionTimeoutException extends HttpException {
  HttpConnectionTimeoutException({required super.message});
}

class HttpSendTimeoutException extends HttpException {
  HttpSendTimeoutException({required super.message});
}

class HttpReceiveTimeoutException extends HttpException {
  HttpReceiveTimeoutException({required super.message});
}

class HttpBadCertificateException extends HttpException {
  HttpBadCertificateException({required super.message});
}

class HttpBadResponseException extends HttpException {
  HttpBadResponseException({required super.message});
}

class HttpCancelException extends HttpException {
  HttpCancelException({required super.message});
}

class HttpConnectionErrorException extends HttpException {
  HttpConnectionErrorException({required super.message});
}

class HttpUnknownException extends HttpException {
  HttpUnknownException({required super.message});
}
