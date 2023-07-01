import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/config/ApiConfig.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/enums/filter_type.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/column_option.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/enum_option.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/filter_option.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/search_config.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/carclean_search.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/search_controller.dart';

class CustomerSearchPage extends ConsumerStatefulWidget {
  const CustomerSearchPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CustomerSearchPage> createState() => _CustomerSearchPageState();
}

class _CustomerSearchPageState extends ConsumerState<CustomerSearchPage> {
  final dataTableKey = GlobalKey();

  final searchConfig = SearchConfig(endpoint: "${ApiConfig.CARCLEAN_API_URL}/customer", orderField: "dsName", filterOnInit: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CarCleanSearch<CustomerModel>(
          config: searchConfig,
          searchBarFilter: const FilterOption(
            title: "Nome",
            field: "dsName",
            type: FilterType.text,
          ),
          filterOptions: const [
            FilterOption(
              title: "Nome",
              field: "dsName",
              type: FilterType.text,
            ),
            FilterOption(
              title: "Documento",
              field: "dsDocument",
              type: FilterType.text,
            ),
            FilterOption(
              title: "E-mail",
              field: "dsEmail",
              type: FilterType.text,
            ),
            FilterOption(title: "Situação", field: "stCustomer", type: FilterType.enumeration, enumOptions: [
              EnumOption(title: "Ativo", value: 1),
              EnumOption(title: "Inativo", value: 0),
            ]),
          ],
          columns: const [
            ColumnOption(title: "Nome", width: 200),
            ColumnOption(title: "Email", width: 500),
            ColumnOption(title: "Telefone", width: 500),
            ColumnOption(title: "Observação", width: 500),
          ],
          cellsBuilder: (context, index, item) {
            return [
              Text(item.dsName),
              Text(item.dsEmail ?? ""),
              Text(item.dsTelephone ?? ""),
              Text(item.dsNote ?? ""),
            ];
          },
          actionsBuilder: (_, index, item) => [],
          itemBuilder: (context, index, item) => ListTile(
            title: Text(item.dsName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                item.dsEmail != null && item.dsEmail!.isNotEmpty ? Text(item.dsEmail!, overflow: TextOverflow.ellipsis) : const SizedBox.shrink(),
                item.dsTelephone != null && item.dsTelephone!.isNotEmpty
                    ? Text(item.dsTelephone!, overflow: TextOverflow.ellipsis)
                    : const SizedBox.shrink()
              ],
            ),
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
                      child: Text(item.dsName.substring(0, 1).toUpperCase()),
                    )),
              ],
            ),
            trailing: const Icon(Icons.navigate_next_rounded),
            onTap: () async {
              final shouldRefresh = await context.push(
                Routes.app.customer.update(item.customerId),
              );
              if (shouldRefresh == true) {
                ref.read(searchControllerProvider(searchConfig).notifier).refresh();
              }
            },
          ),
          fromJsonT: CustomerModel.fromJson,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_rounded),
          onPressed: () async {
            final shouldReload = await context.push(Routes.app.customer.create);
            if (shouldReload == true) {
              ref.read(searchControllerProvider(searchConfig).notifier).refresh();
            }
          }),
    );
  }
}
