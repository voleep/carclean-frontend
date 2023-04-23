import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/shared/models/pagination_model.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_search_list/services/voleep_search_list_service.dart';

final voleepSearchPageControllerProvider =
    AutoDisposeStateNotifierProvider.family<VoleepSearchListController,
        AsyncValue<List<Map<String, dynamic>>>, String>((ref, endpoint) {
  final searchService = ref.read(voleepSearchListServiceProvider);

  return VoleepSearchListController(endpoint: endpoint, service: searchService);
});

class VoleepSearchListController
    extends StateNotifier<AsyncValue<List<Map<String, dynamic>>>> {
  final String endpoint;
  final VoleepSearchListService service;

  String searchQuery = "";

  int currentPage = 1;
  int numberOfPages = 1;
  bool isLoadingMore = false;

  VoleepSearchListController({required this.endpoint, required this.service})
      : super(const AsyncValue.data([])) {
    fetchFirstPage();
  }

  fetchFirstPage() async {
    currentPage = 1;
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final pagination = await fetchPage();

      if (pagination == null) {
        throw Exception("Ocorreu um erro ao buscar dados");
      }

      numberOfPages = pagination.numberOfPages;

      return pagination.pageData;
    });
  }

  fetchNextPage() async {
    isLoadingMore = true;
    currentPage++;

    final newState =
        await AsyncValue.guard<List<Map<String, dynamic>>>(() async {
      final pagination = await fetchPage();

      if (pagination != null) {
        numberOfPages = pagination.numberOfPages;
        return [...state.value ?? [], ...pagination.pageData];
      }

      return state.value ?? [];
    });

    if (newState.hasError == false) {
      state = newState;
    }

    isLoadingMore = false;
  }

  search({required String value, required String searchField}) {
    searchQuery = value.isNotEmpty ? "$searchField:$value" : "";
    fetchFirstPage();
  }

  Future<PaginationModel<Map<String, dynamic>>?> fetchPage() async {
    return await service.findAll(
        endpoint: endpoint,
        page: currentPage,
        orderField: "dsName",
        searchQuery: searchQuery);
  }
}
