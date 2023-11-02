import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  DioExceptions.extractMessage(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.cancel:
        message = "Ocorreu um problema na conexão.";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Tempo de conexão esgotado.";
        break;
      case DioExceptionType.unknown:
        message = "Ocorreu um erro desconhecido.";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Tempo de recebimento de dados esgotado.";
        break;
      case DioExceptionType.sendTimeout:
        message = "Tempo de envio de dados esgotado.";
        break;
      default:
        message = _handleResponse(exception.response);
        break;
    }
  }

  late String message;

  String _handleResponse(Response<dynamic>? response) {
    if (response == null) {
      return "Ocorreu um erro desconhecido.";
    }

    if (response.data != null) {
      try {
        if (response.data['errorMessage'] != null) {
          return response.data['errorMessage'];
        }
      } catch (error) {
        print(error);
      }
    }

    if (response.statusCode != null) {
      switch (response.statusCode) {
        case 503:
          return "Serviço temporariamente indisponível.";
      }
    }

    return "Ocorreu um erro inesperado:\n$response";
  }

  @override
  String toString() => message;
}
