import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:voleep_carclean_frontend/core/config/ApiConfig.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/models/employee_model.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';
import 'package:voleep_carclean_frontend/shared/enums/selection_mode.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/enums/filter_type.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/column_option.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/enum_option.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/filter_option.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/search_config.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/presentation/carclean_search.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/presentation/search_controller.dart';

class EmployeeSearchPage extends ConsumerWidget {
  EmployeeSearchPage({super.key, this.selectionMode = SelectionMode.none});

  final SelectionMode selectionMode;

  final _searchConfig = SearchConfig(
      endpoint: "${ApiConfig.CARCLEAN_API_URL}/employee",
      orderField: "name",
      filterOnInit: true);
  final _searchFilter =
      const FilterOption(title: "Nome", field: "name", type: FilterType.text);
  final _dateFormat = DateFormat("dd/MM/yyyy");
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: CarCleanSearch<EmployeeModel>(
          config: _searchConfig,
          searchBarFilter: _searchFilter,
          filterOptions: [
            _searchFilter,
            const FilterOption(
              title: "Data de cadastro",
              field: "registrationDate",
              type: FilterType.date,
            ),
            const FilterOption(
              title: "Telefone",
              field: "telephone",
              type: FilterType.text,
            ),
            const FilterOption(
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
            ColumnOption(title: "Nome", width: 40),
            ColumnOption(title: "Telefone", width: 300),
            ColumnOption(title: "Data de cadastro", width: 100),
          ],
          cellsBuilder: (context, index, item) {
            return [
              Text(item.name),
              Text(item.telephone ?? ""),
              Text(item.registrationDate.toString()),
            ];
          },
          actionsBuilder: (_, index, item) => [],
          itemBuilder: (context, index, item) => ListTile(
            title: Text(item.name),
            subtitle: Text(
                "${item.telephone ?? "Sem telefone"} - ${_dateFormat.format(item.registrationDate)}"),
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
                      color: Theme.of(context)
                          .colorScheme
                          .surfaceTint
                          .withOpacity(0.5),
                      child: Text(item.name.substring(0, 1).toUpperCase()),
                    )),
              ],
            ),
            trailing: const Icon(Icons.navigate_next_rounded),
            onTap: () async {
              if (selectionMode == SelectionMode.single) {
                return context.pop(item);
              }

              final shouldReload = await context.push(
                Routes.app.employee.update(item.employeeId),
              );
              if (shouldReload == true) {
                ref
                    .read(searchControllerProvider(_searchConfig).notifier)
                    .refreshByIndex(index);
              }
            },
          ),
          fromJsonT: EmployeeModel.fromJson,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_rounded),
          onPressed: () async {
            final shouldReload = await context.push(Routes.app.employee.create);
            if (shouldReload == true) {
              ref
                  .read(searchControllerProvider(_searchConfig).notifier)
                  .refresh();
            }
          }),
    );
  }
}
