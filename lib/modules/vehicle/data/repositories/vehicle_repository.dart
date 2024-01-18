import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/config/api_config.dart';
import 'package:voleep_carclean_frontend/core/constants/strings.dart';
import 'package:voleep_carclean_frontend/core/exceptions/http_exception.dart';
import 'package:voleep_carclean_frontend/core/exceptions/repository_exception.dart';
import 'package:voleep_carclean_frontend/core/extensions/exception_extension.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/data/dtos/create_vehicle_model.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/data/dtos/vehicle_api_dto.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/models/vehicle_model.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/license_plate.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/vehicle_id.dart';
import 'package:voleep_carclean_frontend/shared/enums/http_method.dart';
import 'package:voleep_carclean_frontend/shared/models/filter.dart';
import 'package:voleep_carclean_frontend/shared/models/generic_response_model.dart';
import 'package:voleep_carclean_frontend/shared/models/page_response.dart';

part 'vehicle_repository.g.dart';

@riverpod
VehicleRepository vehicleRepository(VehicleRepositoryRef ref) {
  final http = ref.read(httpClientProvider);
  return VehicleRepository(http: http);
}

class VehicleRepository {
  final endpoint = "${ApiConfig.CARCLEAN_API_URL}/vehicle";

  final HttpClient http;

  VehicleRepository({required this.http});

  Future<Either<RepositoryException, PageResponse<VehicleApiDto>>> getPage(
      List<Filter> query) async {
    final response = await http.get<PageResponse<VehicleApiDto>>(
      endpoint,
      fromJsonT: (json) => PageResponse.fromJson(json, VehicleApiDto.fromJson),
      queryParameters: {"search": query},
    );

    return switch (response) {
      Success(value: final page) => Success(page.data!),
      Failure(:final exception, :final stackTrace) => Failure(
          RepositoryException(exception.message),
          stackTrace,
        ),
    };
  }

  Future<Either<RepositoryException, VehicleModel>> findById(
      VehicleId vehicleId) async {
    final getResponse = await http.get<VehicleApiDto>(
      "$endpoint/$vehicleId",
      fromJsonT: VehicleApiDto.fromJson,
    );

    switch (getResponse) {
      case Success(value: GenericResponse(:final data)):
        if (data == null) {
          return Failure(
            RepositoryException(Strings.veiculoNaoEncontrado),
            StackTrace.current,
          );
        }

        return Success(
          VehicleModel(
            vehicleId: data.vehicleId,
            licensePlate: data.licensePlate,
            description: data.description,
          ),
        );
      case Failure(:final exception, :final stackTrace):
        if (exception is HttpBadResponseException) {
          return Failure(
            RepositoryException(
                exception.message ?? Strings.erroAoCarregarDados),
            stackTrace,
          );
        }

        return Failure(
          RepositoryException(Strings.erroAoCarregarDados),
          stackTrace,
        );
    }
  }

  Future<Either<RepositoryException, VehicleModel>> save(
      CreateVehicleModel createVehicleModel, bool isNew) async {
    final saveResponse = await http.request<VehicleApiDto>(
      endpoint,
      method: isNew ? HttpMethod.post : HttpMethod.put,
      data: createVehicleModel.toJson(),
      fromJsonT: VehicleApiDto.fromJson,
    );

    switch (saveResponse) {
      case Success(value: GenericResponse(:final data)):
        if (data == null) {
          return Failure(
            RepositoryException(Strings.erroAoSalvarDados),
            StackTrace.current,
          );
        }

        return Success(
          VehicleModel(
            vehicleId: data.vehicleId,
            licensePlate: data.licensePlate,
            description: data.description,
          ),
        );
      case Failure(:final exception, :final stackTrace):
        if (exception is HttpBadResponseException) {
          return Failure(
            RepositoryException(exception.message ?? Strings.erroAoSalvarDados),
            stackTrace,
          );
        }

        return Failure(
          RepositoryException(Strings.erroAoSalvarDados),
          stackTrace,
        );
    }
  }

  Future<Either<RepositoryException, bool>> existsByPlate({
    required LicensePlate licensePlate,
    VehicleId? updatingVehicleId,
  }) async {
    final existsResponse = await http.post(
      "$endpoint/exists-by-licenseplate/$licensePlate",
      data: updatingVehicleId,
    );

    switch (existsResponse) {
      case Success(value: GenericResponse(:final data)):
        return Success(data ?? false);
      case Failure(:final exception, :final stackTrace):
        if (exception is HttpBadResponseException) {
          return Failure(
            RepositoryException(
                exception.message ?? Strings.erroVerificarDuplicidadePlaca),
            stackTrace,
          );
        }

        return Failure(
          RepositoryException(Strings.erroVerificarDuplicidadePlaca),
          stackTrace,
        );
    }
  }
}
