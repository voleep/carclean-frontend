import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/config/api_config.dart';
import 'package:voleep_carclean_frontend/core/constants/strings.dart';
import 'package:voleep_carclean_frontend/core/exceptions/http_exception.dart';
import 'package:voleep_carclean_frontend/core/exceptions/repository_exception.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/data/models/create_vehicle_model.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/data/models/vehicle_model.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/models/vehicle.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/license_plate.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/vehicle_id.dart';
import 'package:voleep_carclean_frontend/shared/enums/http_method.dart';
import 'package:voleep_carclean_frontend/shared/models/generic_response_model.dart';

part 'vehicle_repository.g.dart';

@riverpod
VehicleRepository vehicleRepository(VehicleRepositoryRef ref) =>
    VehicleRepository(
      http: ref.read(httpClientProvider),
    );

class VehicleRepository {
  final HttpClient http;

  final String endpoint = "${ApiConfig.CARCLEAN_API_URL}/vehicle";

  VehicleRepository({required this.http});

  Future<Either<RepositoryException, Vehicle>> findById(
      VehicleId vehicleId) async {
    final getResponse = await http.get<VehicleModel>(
      "$endpoint/$vehicleId",
      fromJsonT: VehicleModel.fromJson,
    );

    switch (getResponse) {
      case Success(value: GenericResponse(:final data)):
        if (data == null) {
          return Failure(
            RepositoryException(message: Strings.veiculoNaoEncontrado),
            StackTrace.current,
          );
        }

        return Success(
          Vehicle(
            vehicleId: data.vehicleId,
            licensePlate: data.licensePlate,
            description: data.description,
          ),
        );
      case Failure(:final exception, :final stackTrace):
        if (exception is HttpBadResponseException) {
          return Failure(
            RepositoryException(
                message: exception.message ?? Strings.erroAoCarregarDados),
            stackTrace,
          );
        }

        return Failure(
          RepositoryException(message: Strings.erroAoCarregarDados),
          stackTrace,
        );
    }
  }

  Future<Either<RepositoryException, Vehicle>> save(
      CreateVehicleModel createVehicleModel, bool isNew) async {
    final saveResponse = await http.request<VehicleModel>(
      endpoint,
      method: isNew ? HttpMethod.post : HttpMethod.put,
      data: createVehicleModel.toJson(),
      fromJsonT: VehicleModel.fromJson,
    );

    switch (saveResponse) {
      case Success(value: GenericResponse(:final data)):
        if (data == null) {
          return Failure(
            RepositoryException(message: Strings.erroAoSalvarDados),
            StackTrace.current,
          );
        }

        return Success(
          Vehicle(
            vehicleId: data.vehicleId,
            licensePlate: data.licensePlate,
            description: data.description,
          ),
        );
      case Failure(:final exception, :final stackTrace):
        if (exception is HttpBadResponseException) {
          return Failure(
            RepositoryException(
                message: exception.message ?? Strings.erroAoSalvarDados),
            stackTrace,
          );
        }

        return Failure(
          RepositoryException(message: Strings.erroAoSalvarDados),
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
                message:
                    exception.message ?? Strings.erroVerificarDuplicidadePlaca),
            stackTrace,
          );
        }

        return Failure(
          RepositoryException(message: Strings.erroVerificarDuplicidadePlaca),
          stackTrace,
        );
    }
  }
}
