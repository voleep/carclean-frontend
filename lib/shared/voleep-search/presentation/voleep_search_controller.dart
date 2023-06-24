import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/shared/enums/direction.dart';
import 'package:voleep_carclean_frontend/shared/models/pagination_model.dart';
import 'package:voleep_carclean_frontend/shared/voleep-search/data/repositories/providers/voleep_search_repository_provider.dart';
import 'package:voleep_carclean_frontend/shared/voleep-search/domain/models/voleep_search_family_model.dart';
import 'package:voleep_carclean_frontend/shared/voleep-search/domain/models/voleep_search_model.dart';

class VoleepSearchController<T> extends AutoDisposeFamilyAsyncNotifier<
    VoleepSearchModel<T>, VoleepSearchOptionsModel> {
  final T Function(Map<String, dynamic> json) converter;

  VoleepSearchController({required this.converter});

  @override
  FutureOr<VoleepSearchModel<T>> build(VoleepSearchOptionsModel arg) async {
    final pagination = await _fetch(page: 1, orderField: arg.orderField);
    final customerList =
        pagination.pageData.map((json) => converter(json)).toList();
    return VoleepSearchModel(
      data: customerList,
      orderField: arg.orderField,
      currentPage: pagination.currentPage,
      numberOfItems: pagination.numberOfItems,
      numberOfPager: pagination.numberOfPages,
    );
  }

  Future<void> search({required String searchQuery}) async {
    state = await AsyncValue.guard<VoleepSearchModel<T>>(() async {
      final pagination = await _fetch(
          page: 1,
          orderField: state.value?.orderField ?? arg.orderField,
          searchQuery: searchQuery);

      final customerList =
          pagination.pageData.map((json) => converter(json)).toList();

      return VoleepSearchModel(
        data: customerList,
        orderField: arg.orderField,
        currentPage: pagination.currentPage,
        numberOfItems: pagination.numberOfItems,
        numberOfPager: pagination.numberOfPages,
        searchQuery: searchQuery,
      );
    });
  }

  Future<PaginationModel<Map<String, dynamic>>> _fetch({
    required int page,
    required String orderField,
    String searchQuery = "",
    Direction orderDirection = Direction.asc,
  }) async {
    final pagination = await ref
        .read(
          voleepSearchRepositoryProvider(arg.endpoint),
        )
        .listAll(
            page: page,
            orderField: orderField,
            searchQuery: searchQuery,
            orderDirection: orderDirection);

    if (pagination == null) {
      throw Exception('Ocorreu um erro');
    }

    return pagination;
  }
}
