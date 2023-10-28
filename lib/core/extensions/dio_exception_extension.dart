import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:voleep_carclean_frontend/shared/models/generic_response_model.dart';

extension DioExceptionExtension on DioException {
  String? get responseMessage {
    if (response == null) {
      return null;
    }

    final Response(:statusCode, :data) = response!;

    if (data != null) {
      try {
        final GenericResponse<dynamic>(:errorMessage) = GenericResponse.fromJsonT(data, (json) => json);
        return errorMessage;
      } catch (e, s) {
        log('Erro ao desserializar resposta de erro da API', error: e, stackTrace: s);
      }
    }

    if (statusCode == HttpStatus.serviceUnavailable) {
      return "Serviço temporariamente indisponível.";
    }

    return null;
  }
}
