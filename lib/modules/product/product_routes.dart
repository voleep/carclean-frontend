import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/product/presentation/product_edit/product_edit_page.dart';

abstract class ProductRoutes {
  static const list = '/produtos';
  String edit(String id) => '/produto/$id';
}

List<GoRoute> productRoutes = [
  GoRoute(
    path: ":id",
    builder: (context, state) {
      final String id = state.pathParameters['id']!;
      return ProductEditPage(id: id);
    },
  ),
];
