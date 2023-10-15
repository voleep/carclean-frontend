sealed class HttpException implements Exception {
  final String? message;
  HttpException({this.message});
}

class HttpConnectionTimeoutException extends HttpException {
  HttpConnectionTimeoutException({super.message});
}

class HttpSendTimeoutException extends HttpException {
  HttpSendTimeoutException({super.message});
}

class HttpReceiveTimeoutException extends HttpException {
  HttpReceiveTimeoutException({super.message});
}

class HttpBadCertificateException extends HttpException {
  HttpBadCertificateException({super.message});
}

class HttpBadResponseException extends HttpException {
  HttpBadResponseException({super.message});
}

class HttpCancelException extends HttpException {
  HttpCancelException({super.message});
}

class HttpConnectionErrorException extends HttpException {
  HttpConnectionErrorException({super.message});
}

class HttpUnknownException extends HttpException {
  HttpUnknownException({super.message});
}
