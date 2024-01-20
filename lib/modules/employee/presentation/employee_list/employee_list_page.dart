import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee.dart';
import 'package:voleep_carclean_frontend/modules/employee/employee_routes.dart';
import 'package:voleep_carclean_frontend/modules/employee/infra/employee_provider.dart';
import 'package:voleep_carclean_frontend/shared/enums/selection.dart';
import 'package:voleep_carclean_frontend/shared/utils/list_controller.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scaffold_with_list/scaffold_with_list.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_list_tile/voleep_list_tile.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_sliver_bar/voleep_sliver_bar.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_sliver_search/voleep_sliver_search.dart';

class EmployeeListPage extends ConsumerStatefulWidget {
  const EmployeeListPage({super.key, this.selection = Selection.none});

  final Selection selection;

  @override
  ConsumerState<EmployeeListPage> createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends ConsumerState<EmployeeListPage> {
  late final ListController<Employee> listController;

  @override
  void initState() {
    listController = ListController(
      selection: widget.selection,
      selectionKey: (item) => item.id,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithList(
      headerSlivers: [
        const VoleepSliverBar(
          title: "Colaboradores",
        ),
        VoleepSliverSearch(
          field: 'name',
          controller: listController,
        ),
      ],
      controller: listController,
      onSearch: ref.read(findAllEmployeesUsecaseProvider).execute,
      itemBuilder: (context, index, item) {
        return VoleepListTile(
          title: item.name,
          item: item,
          controller: listController,
          onEdit: goToUpdate,
        );
      },
      onDone: () => context.pop(listController.selected),
      onNew: goToNew,
    );
  }

  goToNew() async {
    context.push(EmployeeRoutes.create);
  }

  goToUpdate(Employee employee) async {
    context.push(EmployeeRoutes.edit(employee.id));
  }

  @override
  void dispose() {
    listController.dispose();

    super.dispose();
  }
}
