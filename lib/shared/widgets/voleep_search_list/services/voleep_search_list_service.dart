import 'package:hooks_riverpod/hooks_riverpod.dart' show Provider;
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/core/http/providers/http_client_provider.dart';

import '../../../enums/direction.dart';
import '../../../models/pagination_model.dart';

final voleepSearchListServiceProvider = Provider.autoDispose((ref) {
  final http = ref.watch(httpClientProvider);

  return VoleepSearchListService(http: http);
});

class VoleepSearchListService {
  final HttpClient http;

  const VoleepSearchListService({required this.http});

  Future<PaginationModel<Map<String, dynamic>>?> findAll(
      {required String endpoint,
      required int page,
      required String orderField,
      String searchQuery = "",
      Direction orderDirection = Direction.asc}) async {
    final response = await http.get(
        "$endpoint?search=orderDirection:${orderDirection.name.toUpperCase()},orderField:$orderField,page:$page,$searchQuery");

    if (response.data == null) {
      return null;
    }

    return PaginationModel.fromJson(
        response.data!, (json) => json as Map<String, dynamic>);
  }
}
