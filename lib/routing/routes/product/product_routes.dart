import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/product/domain/typedefs/product_id.dart';
import 'package:voleep_carclean_frontend/modules/product/presentation/product_edit/product_edit_page.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';

class ProductRoutes {
  static String name = "product";

  final String root;

  get create => "$root/new";

  update(ProductId id) => "$root/$id";

  ProductRoutes.forChild({
    required String parentPath,
  }) : root = "$parentPath/$name";

  List<RouteBase> get routes => [
        GoRoute(
          parentNavigatorKey: Routes.i.navigationkey,
          path: "$root/:id",
          builder: (context, state) {
            final String id = state.pathParameters['id']!;
            return ProductEditPage(id: id);
          },
        ),
      ];
}
