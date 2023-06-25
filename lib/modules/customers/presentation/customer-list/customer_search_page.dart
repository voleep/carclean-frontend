import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/core/config/ApiConfig.dart';
import 'package:voleep_carclean_frontend/modules/customers/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/enums/filter_type.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/action_option.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/column_option.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/enum_option.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/filter_option.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/search_config.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/carclean_search.dart';
import 'package:voleep_carclean_frontend/shared/widgets/delete_bottom_sheet/delete_bottom_sheet.dart';
import 'package:voleep_carclean_frontend/shared/widgets/loading/loading_screen.dart';

class CustomerSearchPage extends StatefulWidget {
  const CustomerSearchPage({Key? key}) : super(key: key);

  @override
  State<CustomerSearchPage> createState() => _CustomerSearchPageState();
}

class _CustomerSearchPageState extends State<CustomerSearchPage> {
  final dataTableKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CarCleanSearch<CustomerModel>(
        config: SearchConfig(endpoint: "${ApiConfig.CARCLEAN_API_URL}/customer", orderField: "dsName", filterOnInit: true),
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
          FilterOption(title: "Data de cadastro", field: "dh", type: FilterType.date),
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
        actionsBuilder: (_, index, item) => [
          ActionOption(
            title: "Editar",
            icon: Icons.edit_rounded,
            backgroundColor: Colors.greenAccent,
            foregroundColor: const Color.fromARGB(255, 11, 88, 13),
            onTap: () {
              context.push(Routes.app.customer.update(item.customerId));
            },
          ),
          ActionOption(
            title: "Excluir",
            icon: Icons.delete_rounded,
            backgroundColor: Colors.redAccent,
            onTap: () async {
              final value = await showModalBottomSheet(
                useRootNavigator: true,
                context: context,
                builder: (context) => const DeleteBottomSheet(),
              );
            },
          ),
        ],
        itemBuilder: (context, index, item) => ListTile(
          title: Text(item.dsName),
          subtitle: Text(item.dsEmail ?? ""),
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
          onTap: () => context.push(
            Routes.app.customer.update(item.customerId),
          ),
        ),
        fromJsonT: CustomerModel.fromJson,
      ),
    );
  }
}
