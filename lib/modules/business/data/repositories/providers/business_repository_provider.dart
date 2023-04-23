import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/http/providers/http_client_provider.dart';
import 'package:voleep_carclean_frontend/modules/business/data/repositories/business_repository.dart';

final businessRepositoryProvider = Provider<BusinessRepository>(
  (ref) {
    final http = ref.watch(httpClientProvider);

    return BusinessRepository(http: http);
  },
);
