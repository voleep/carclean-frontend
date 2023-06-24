import 'package:voleep_carclean_frontend/core/config/ApiConfig.dart';
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/data/dtos/create_vehicle_dto.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/data/dtos/update_vehicle_dto.dart';
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

  Future<VehicleModel?> save(CreateVehicleDTO createVehicleDTO) async {
    final response = await http.post(endpoint, data: createVehicleDTO.toJson());

    if (response.data == null) {
      return null;
    }

    return VehicleModel.fromJson(response.data!);
  }

  Future<VehicleModel?> update(UpdateVehicleDTO updateVehicleDTO) async {
    final response = await http.put(endpoint, data: updateVehicleDTO.toJson());

    if (response.data == null) {
      return null;
    }

    return VehicleModel.fromJson(response.data!);
  }
}
