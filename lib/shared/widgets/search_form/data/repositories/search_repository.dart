import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/core/http/providers/http_client_provider.dart';
import 'package:voleep_carclean_frontend/shared/enums/direction.dart';
import 'package:voleep_carclean_frontend/shared/models/pagination_model.dart';

part 'search_repository.g.dart';

@riverpod
SearchRepository searchRepository(SearchRepositoryRef ref, String endpoint) => SearchRepository(
      http: ref.watch(httpClientProvider),
      endpoint: endpoint,
    );

class SearchRepository {
  const SearchRepository({required this.http, required this.endpoint});

  final HttpClient http;
  final String endpoint;

  Future<PaginationModel<Map<String, dynamic>>?> listAll({
    required int page,
    required String orderField,
    String searchQuery = "",
    Direction orderDirection = Direction.asc,
  }) async {
    final response =
        await http.get("$endpoint?search=orderDirection:${orderDirection.name.toUpperCase()},orderField:$orderField,page:$page,$searchQuery");

    if (response.data == null) {
      return null;
    }

    return PaginationModel.fromJson(response.data!, (json) => json as Map<String, dynamic>);
  }
}
