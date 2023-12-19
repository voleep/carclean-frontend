import 'package:flutter_test/flutter_test.dart';
import 'package:voleep_carclean_frontend/shared/models/generic_response_model.dart';

class _DataModel {
  final int id;
  final String name;
  _DataModel({required this.id, required this.name});

  factory _DataModel.fromJson(Map<String, dynamic> json) {
    return _DataModel(
      id: json['id'],
      name: json['name'],
    );
  }
}

void main() {
  group('Generic Response Model', () {
    test('Deve ser possível desserializar uma resposta com data do tipo JSON',
        () {
      const expectedId = 123;
      const expectedName = "Voleep test";

      final json = <String, dynamic>{
        'data': {
          'id': expectedId,
          'name': expectedName,
        },
        'errorMessage': null
      };

      final response =
          GenericResponse<_DataModel>.fromJsonT(json, _DataModel.fromJson);

      expect(expectedId, response.data!.id);
      expect(expectedName, response.data!.name);
    });

    test(
        'Deve ser possível desserializar uma resposta com data do tipo boolean',
        () {
      const expectedData = false;

      final json = <String, dynamic>{
        'data': expectedData,
        'errorMessage': null
      };

      final response = GenericResponse<bool>.fromJson(json);

      expect(expectedData, response.data);
    });

    test('Deve ser possível desserializar uma resposta com data do tipo string',
        () {
      const expectedData = "Voleep CarClean Test";

      final json = <String, dynamic>{
        'data': expectedData,
        'errorMessage': null
      };

      final response = GenericResponse<String>.fromJson(json);

      expect(expectedData, response.data);
    });

    test(
        'Deve ser possível desserializar uma resposta com data do tipo integer',
        () {
      const expectedData = 1234567890;

      final json = <String, dynamic>{
        'data': expectedData,
        'errorMessage': null
      };

      final response = GenericResponse<int>.fromJson(json);

      expect(expectedData, response.data);
    });

    test(
        'Deve ser possível desserializar uma resposta com campo errorMessage preenchido',
        () {
      const expectedErrorMessage =
          "Infelizmente não conseguimos obter uma resposta";

      final json = <String, dynamic>{
        'data': null,
        'errorMessage': expectedErrorMessage
      };

      final response = GenericResponse.fromJson(json);

      expect(expectedErrorMessage, response.errorMessage);
    });
  });
}
