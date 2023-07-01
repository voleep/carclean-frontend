import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/config/ApiConfig.dart';
import 'package:voleep_carclean_frontend/modules/product/domain/models/product_model.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/enums/filter_type.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/action_option.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/column_option.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/enum_option.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/filter_option.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/search_config.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/carclean_search.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/search_controller.dart';
import 'package:voleep_carclean_frontend/shared/widgets/delete_bottom_sheet/delete_bottom_sheet.dart';

class ProductSearchPage extends ConsumerWidget {
  ProductSearchPage({super.key});

  final _searchConfig = SearchConfig(endpoint: "${ApiConfig.CARCLEAN_API_URL}/product", orderField: "code", filterOnInit: true);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: CarCleanSearch<ProductModel>(
          config: _searchConfig,
          searchBarFilter: const FilterOption(
            title: "Produto",
            field: "description",
            type: FilterType.text,
          ),
          filterOptions: const [
            FilterOption(
              title: "Código",
              field: "code",
              type: FilterType.number,
            ),
            FilterOption(
              title: "Produto",
              field: "description",
              type: FilterType.text,
            ),
            FilterOption(
              title: "Valor",
              field: "price",
              type: FilterType.number,
            ),
            FilterOption(
              title: "Situação",
              field: "situation",
              type: FilterType.enumeration,
              enumOptions: [
                EnumOption(title: "Ativo", value: 1),
                EnumOption(title: "Inativo", value: 0),
              ],
            ),
          ],
          columns: const [
            ColumnOption(title: "Código", width: 50),
            ColumnOption(title: "Descrição", width: 700),
            ColumnOption(title: "Valor", width: 50),
          ],
          cellsBuilder: (context, index, item) {
            return [
              Text(item.code.toString()),
              Text(item.description),
              Text(item.price?.toString() ?? ""),
            ];
          },
          actionsBuilder: (_, index, item) => [],
          itemBuilder: (context, index, item) => ListTile(
            title: Text(item.description),
            subtitle: Text(
                "${item.price != null ? "R\$ ${item.price!.toStringAsFixed(2)}" : "Sem preço"} - ${item.availableStock != null ? "Estoque: ${item.availableStock}" : "Estoque não definido"}"),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: AlignmentDirectional.center,
                      color: Theme.of(context).colorScheme.surfaceTint.withOpacity(0.5),
                      child: Text(item.code.toString()),
                    )),
              ],
            ),
            trailing: const Icon(Icons.navigate_next_rounded),
            onTap: () async {
              final shouldReload = await context.push(
                Routes.app.product.update(item.productId),
              );
              if (shouldReload == true) {
                ref.read(searchControllerProvider(_searchConfig).notifier).refresh();
              }
            },
          ),
          fromJsonT: ProductModel.fromJson,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_rounded),
          onPressed: () async {
            final shouldReload = await context.push(Routes.app.product.create);
            if (shouldReload == true) {
              ref.read(searchControllerProvider(_searchConfig).notifier).refresh();
            }
          }),
    );
  }
}
