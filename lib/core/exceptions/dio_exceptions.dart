import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  DioExceptions.fromDioError({required DioError dioError}) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Ocorreu um problema na conexão";
        break;
      case DioErrorType.connectionTimeout:
        message = "Tempo esgotado. Por favor, tente novamente";
        break;
      case DioErrorType.unknown:
        message = "Ocorreu um problema na conexão";
        break;
      case DioErrorType.receiveTimeout:
        message = "Tempo esgotado. Por favor, tente novamente";
        break;
      case DioErrorType.badResponse:
        message = _handleError(
                dioError.response!.statusCode!, dioError.response!.data) ??
            "Ocorreu um erro";
        break;
      case DioErrorType.sendTimeout:
        message = "Tempo esgotado. Por favor, tente novamente";
        break;
      default:
        message = "Algo saiu errado";
        break;
    }
  }

  late String message;

  String? _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 404:
        return error["message"];
      case 500:
        return error["message"];
      default:
        return 'Oops... Algo saiu errado';
    }
  }

  @override
  String toString() => message;
}
