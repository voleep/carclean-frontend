import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/constants/strings.dart';
import 'package:voleep_carclean_frontend/core/exceptions/http_exception.dart';
import 'package:voleep_carclean_frontend/core/exceptions/repository_exception.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/shared/enums/direction.dart';
import 'package:voleep_carclean_frontend/shared/models/generic_response_model.dart';
import 'package:voleep_carclean_frontend/shared/models/pagination_model.dart';

part 'search_repository.g.dart';

@riverpod
SearchRepository searchRepository(SearchRepositoryRef ref, String endpoint) =>
    SearchRepository(
      http: ref.watch(httpClientProvider),
      endpoint: endpoint,
    );

class SearchRepository {
  const SearchRepository({required this.http, required this.endpoint});

  final HttpClient http;
  final String endpoint;

  Future<Either<RepositoryException, PaginationModel<Map<String, dynamic>>>>
      listAll({
    required int page,
    required String orderField,
    String searchQuery = "",
    Direction orderDirection = Direction.asc,
  }) async {
    final getPageResult = await http.auth.get(
        "$endpoint?search=orderDirection:${orderDirection.name.toUpperCase()},orderField:$orderField,page:$page,$searchQuery");

    switch (getPageResult) {
      case Success(value: GenericResponse(:final data)):
        if (data == null || data is! Map<String, dynamic>) {
          return Failure(RepositoryException(Strings.erroAoCarregarDados),
              StackTrace.current);
        }

        return Success(PaginationModel.fromJson(
            data!, (json) => json as Map<String, dynamic>));
      case Failure(:final exception, :final stackTrace):
        if (exception is HttpBadResponseException) {
          return Failure(
              RepositoryException(
                  exception.message ?? Strings.erroAoCarregarDados),
              stackTrace);
        }

        return Failure(
            RepositoryException(Strings.erroAoCarregarDados), stackTrace);
    }
  }
}
