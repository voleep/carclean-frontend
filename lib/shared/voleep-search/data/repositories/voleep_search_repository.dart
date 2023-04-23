import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/http/providers/http_client_provider.dart';
import 'package:voleep_carclean_frontend/shared/enums/direction.dart';
import 'package:voleep_carclean_frontend/shared/models/pagination_model.dart';

class VoleepSearchRepository {
  final Ref ref;

  final String endpoint;

  VoleepSearchRepository({required this.ref, required this.endpoint});

  Future<PaginationModel<Map<String, dynamic>>?> listAll({
    required int page,
    required String orderField,
    String searchQuery = "",
    Direction orderDirection = Direction.asc,
  }) async {
    final response = await ref.read(httpClientProvider).get(
        "$endpoint?search=orderDirection:${orderDirection.name.toUpperCase()},orderField:$orderField,page:$page,$searchQuery");

    if (response.data == null) {
      return null;
    }

    return PaginationModel.fromJson(
        response.data!, (json) => json as Map<String, dynamic>);
  }
}
