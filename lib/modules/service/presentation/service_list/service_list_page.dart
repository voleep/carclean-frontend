import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/service/service_routes.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_list_tile/voleep_list_tile.dart';
import 'package:voleep_carclean_frontend/modules/service/data/repositories/service_repository.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/entities/service.dart';
import 'package:voleep_carclean_frontend/shared/enums/selection.dart';
import 'package:voleep_carclean_frontend/shared/utils/list_controller.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scaffold_with_list/scaffold_with_list.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_sliver_bar/voleep_sliver_bar.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_sliver_search/voleep_sliver_search.dart';

class ServiceListPage extends ConsumerStatefulWidget {
  const ServiceListPage({super.key, this.selection = Selection.none});

  final Selection selection;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ServiceListPageState();
}

class _ServiceListPageState extends ConsumerState<ServiceListPage> {
  late final ListController<Service> listController;

  @override
  void initState() {
    super.initState();

    listController = ListController(
      selection: widget.selection,
      selectionKey: (item) => item.serviceId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithList(
      headerSlivers: [
        VoleepSliverBar(
          title: 'Serviços',
        ),
        VoleepSliverSearch(
          field: 'description',
          controller: listController,
        )
      ],
      controller: listController,
      onGetPage: ref.read(serviceRepositoryProvider).getPage,
      itemBuilder: (context, index, item) => VoleepListTile(
        title: item.description,
        subtitle:
            "${item.fullDescription}\nValor: R\$ ${item.price.toStringAsFixed(2)}",
        item: item,
        controller: listController,
        onEdit: goToUpdate,
      ),
      onNew: goToNew,
      onDone: () => context.pop(listController.selected),
    );
  }

  Future<void> goToNew() async {
    await context.push(ServiceRoutes.create);
    listController.notifyFilterListeners();
  }

  Future<void> goToUpdate(Service item) async {
    await context.push(ServiceRoutes.edit(item.serviceId));
    listController.setFuture(
      () => ref.read(serviceRepositoryProvider).findById(item.serviceId),
      replacing: item,
    );
  }

  @override
  void dispose() {
    listController.dispose();

    super.dispose();
  }
}
