import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/oauth/oauth_session.dart';
import 'package:voleep_carclean_frontend/modules/business/data/repositories/business_repository.dart';
import 'package:voleep_carclean_frontend/modules/oauth/data/dtos/create_business_dto.dart';

class CreateBusinessPageController extends StateNotifier<AsyncValue<void>> {
  final Ref ref;
  CreateBusinessPageController({required this.ref}) : super(const AsyncData(null));

  Future<void> createBusiness({required String businessName}) async {
    state = const AsyncValue.loading();

    final dto = CreateBusinessDTO(dsNomeFantasia: businessName);
    final createBusinessResult = await ref.read(businessRepositoryProvider).createBusiness(createBusinessDTO: dto);

    switch (createBusinessResult) {
      case Success(:final value):
        ref.read(oAuthSessionProvider.notifier).set(authModel: value);
        state = const AsyncValue.data(null);
      case Failure(:final exception, :final stackTrace):
        state = AsyncValue.error(exception, stackTrace);
    }
  }
}
