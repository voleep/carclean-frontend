import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/shared/voleep-search/data/repositories/voleep_search_repository.dart';
import 'package:voleep_carclean_frontend/shared/voleep-search/domain/typedefs/voleep_search_endpoint.dart';

final voleepSearchRepositoryProvider =
    AutoDisposeProvider.family<VoleepSearchRepository, Endpoint>(
  (ref, endpoint) => VoleepSearchRepository(ref: ref, endpoint: endpoint),
);
