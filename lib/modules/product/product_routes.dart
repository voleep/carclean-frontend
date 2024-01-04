import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/product/presentation/product_edit/product_edit_page.dart';

abstract class ProductRoutes {
  static const list = '/produtos';

  static const create = '/produto/new';

  static String edit(String id) => '/produto/$id';
}

final productRoutes = <GoRoute>[
  GoRoute(
    path: ":id",
    builder: (context, state) {
      final String id = state.pathParameters['id']!;
      return ProductEditPage(id: id);
    },
  ),
];
