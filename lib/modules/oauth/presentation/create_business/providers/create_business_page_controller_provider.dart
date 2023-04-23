import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/create_business/create_business_page_controller.dart';

final createBusinessPageControllerProvider = StateNotifierProvider.autoDispose<
    CreateBusinessPageController, AsyncValue<void>>(
  (ref) => CreateBusinessPageController(ref: ref),
);
