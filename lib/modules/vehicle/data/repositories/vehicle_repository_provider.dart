import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/http/providers/http_client_provider.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/data/repositories/vehicle_repository.dart';

final vehicleRepositoryProvider = Provider<VehicleRepository>((ref) {
  final http = ref.watch(httpClientProvider);
  return VehicleRepository(http: http);
});
