import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/http/providers/http_client_provider.dart';
import 'package:voleep_carclean_frontend/modules/customers/data/repositories/customer_repository.dart';

final customerRepositoryProvider = Provider(
  (ref) => CustomerRepository(
    http: ref.watch(httpClientProvider),
  ),
);
