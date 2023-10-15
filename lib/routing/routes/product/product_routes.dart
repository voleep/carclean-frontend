import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/product/domain/typedefs/product_id.dart';
import 'package:voleep_carclean_frontend/modules/product/presentation/product_form/product_form_page.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';
import 'package:voleep_carclean_frontend/shared/enums/form_mode.dart';

class ProductRoutes {
  static String name = "product";

  final String root;

  get create => "$root/new";

  update(ProductId id) => "$root/$id/${FormMode.update.name}";

  copy(ProductId id) => "$root/$id/${FormMode.copy.name}";

  ProductRoutes.forChild({
    required String parentPath,
  }) : root = "$parentPath/$name";

  List<RouteBase> get routes => [
        GoRoute(
          parentNavigatorKey: Routes.i.navigationkey,
          path: "$root/:id/:mode",
          builder: (context, state) {
            final String id = state.pathParameters['id']!;
            final String mode = state.pathParameters['mode']!;
            return ProductFormPage(
              productId: id,
              mode: FormMode.valueOf(mode),
            );
          },
        ),
        GoRoute(
          parentNavigatorKey: Routes.i.navigationkey,
          path: create,
          builder: (context, state) {
            return const ProductFormPage(
              mode: FormMode.create,
            );
          },
        )
      ];
}
