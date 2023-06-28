import 'package:voleep_carclean_frontend/core/config/ApiConfig.dart';
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/models/vehicle_model.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/vehicle_typedefs.dart';

class VehicleRepository {
  VehicleRepository({required this.http});

  final HttpClient http;

  get endpoint => "${ApiConfig.CARCLEAN_API_URL}/vehicle";

  Future<VehicleModel?> findById(VehicleId vehicleId) async {
    final response = await http.get("$endpoint/$vehicleId");

    if (response.data == null) {
      return null;
    }

    return VehicleModel.fromJson(response.data!);
  }

  Future<VehicleModel?> save(VehicleModel vehicleDTO) async {
    final response = await http.post(endpoint, data: vehicleDTO.toJson());

    if (response.data == null) {
      return null;
    }

    return VehicleModel.fromJson(response.data!);
  }

  Future<VehicleModel?> update(VehicleModel vehicleDTO) async {
    final response = await http.put(endpoint, data: vehicleDTO.toJson());

    if (response.data == null) {
      return null;
    }

    return VehicleModel.fromJson(response.data!);
  }

  Future<bool> existsByLicensePlate({required String licensePlate, String? updatingVehicleId}) async {
    final response = await http.post("$endpoint/exists-by-licenseplate/$licensePlate", data: updatingVehicleId);
    if (response.data == null) {
      return false;
    }

    return response.data as bool;
  }
}
