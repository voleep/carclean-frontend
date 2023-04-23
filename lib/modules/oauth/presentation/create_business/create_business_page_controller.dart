import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/oauth/oauth_state_provider.dart';
import 'package:voleep_carclean_frontend/modules/business/data/repositories/providers/business_repository_provider.dart';
import 'package:voleep_carclean_frontend/modules/oauth/data/dtos/create_business_dto.dart';

class CreateBusinessPageController extends StateNotifier<AsyncValue<void>> {
  final Ref ref;
  CreateBusinessPageController({required this.ref})
      : super(const AsyncData(null));

  Future<void> createBusiness({required String businessName}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard<void>(() async {
      final dto = CreateBusinessDTO(dsNomeFantasia: businessName);

      final authModel = await ref
          .read(businessRepositoryProvider)
          .createBusiness(createBusinessDTO: dto);

      ref.read(oAuthStateProvider.notifier).saveAuthInfo(authModel: authModel);
    });
  }
}
