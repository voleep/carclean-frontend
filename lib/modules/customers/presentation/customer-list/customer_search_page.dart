import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/config/ApiConfig.dart';
import 'package:voleep_carclean_frontend/modules/customers/presentation/customer-list/providers/customer_search_provider.dart';
import 'package:voleep_carclean_frontend/shared/responsive/responsive.dart';
import 'package:voleep_carclean_frontend/shared/voleep-search/domain/models/voleep_search_family_model.dart';
import 'package:voleep_carclean_frontend/shared/voleep-search/presentation/voleep_search_filter_view.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_silver_appbar.dart';

class CustomerSearchPage extends StatefulWidget {
  const CustomerSearchPage({Key? key}) : super(key: key);

  @override
  State<CustomerSearchPage> createState() => _CustomerSearchPageState();
}

class _CustomerSearchPageState extends State<CustomerSearchPage> {
  final searchFamilyModel = VoleepSearchFamilyModel(
      endpoint: '${ApiConfig.CARCLEAN_API_URL}/customer', orderField: 'dsName');
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final searchController = ref.watch(customerSearchProvider(
          searchFamilyModel,
        ));

        final controller = ref.read(customerSearchProvider(
          searchFamilyModel,
        ).notifier);

        return Responsive(
          mobile: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, _) => [
              VoleepSliverAppBar(
                titleSpacing: 24,
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.1),
                      child: Center(
                        child: TextField(
                          textInputAction: TextInputAction.search,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Pesquisar',
                            prefixIcon: Icon(Icons.search),
                          ),
                          onChanged: (value) => controller.search(
                              searchQuery:
                                  value.isNotEmpty ? "dsName:$value" : ""),
                          onSubmitted: (value) => controller.search(
                              searchQuery:
                                  value.isNotEmpty ? "dsName:$value" : ""),
                          onTapOutside: (event) =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                          onEditingComplete: () =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                        ),
                      ),
                    ),
                  ),
                ),
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(8),
                  child: Divider(
                    height: 1,
                  ),
                ),
                snap: true,
                floating: true,
              )
            ],
            body: NotificationListener<ScrollNotification>(
              onNotification: (scroll) {
                // final controller =
                //     ref.read(voleepSearchPageControllerProvider(endpoint).notifier);

                // final metrics = scroll.metrics;
                // if (metrics.pixels > metrics.maxScrollExtent - 100) {
                //   final bool hasMorePages =
                //       controller.currentPage < controller.numberOfPages;
                //   if (!controller.isLoadingMore && hasMorePages) {
                //     controller.fetchNextPage();
                //   }
                // }
                return true;
              },
              child: RefreshIndicator(
                onRefresh: () async => {
                  await ref
                      .read(customerSearchProvider(searchFamilyModel).notifier)
                      .future
                },
                child: Consumer(builder: (context, ref, widget) {
                  return searchController.when(
                    error: (error, stackTrace) {
                      return const Center(
                        child: Text("Ocorreu um error"),
                      );
                    },
                    data: (searchModel) {
                      final itemCount = searchModel.data.length;

                      return ListView.separated(
                        itemCount: itemCount,
                        itemBuilder: (context, index) {
                          if (index == itemCount) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          final customer = searchModel.data[index];
                          return ListTile(
                            title: Text(customer.dsName),
                            subtitle: Text(customer.dsEmail ?? ""),
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50)),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      alignment: AlignmentDirectional.center,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .surfaceTint
                                          .withOpacity(0.5),
                                      child: Text(customer.dsName
                                          .substring(0, 1)
                                          .toUpperCase()),
                                    )),
                              ],
                            ),
                            trailing: const Icon(Icons.navigate_next_rounded),
                            onTap: () => context
                                .push("/app/customer/${customer.customerId}"),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(height: 1);
                        },
                      );
                    },
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                }),
              ),
            ),
          ),
          desktop: Column(
            children: [
              VoleepSearchFilter(
                controller: ref
                    .read(customerSearchProvider(searchFamilyModel).notifier),
                searchField: "dsName",
              ),
              searchController.when(
                data: (searchModel) {
                  return Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: Card(
                        margin: const EdgeInsets.all(12),
                        child: SingleChildScrollView(
                          child: DataTable(
                            columns: const [
                              DataColumn(label: Text('Nome')),
                              DataColumn(label: Text('Email')),
                              DataColumn(label: Text('Telefone')),
                              DataColumn(label: Text('Documento')),
                              DataColumn(label: Text('Observação')),
                            ],
                            rows: searchModel.data
                                .map((customer) => DataRow(cells: [
                                      DataCell(Text(customer.dsName)),
                                      DataCell(Text(customer.dsEmail ??
                                          'Não cadastrado')),
                                      DataCell(Text(customer.dsTelephone ??
                                          'Não cadastrado')),
                                      DataCell(Text(customer.dsDocument ??
                                          'Não cadastrado')),
                                      DataCell(
                                          Text(customer.dsNote ?? 'Nenhuma'))
                                    ]))
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                error: (error, stackTrace) => Center(
                  child: Text(
                    error.toString(),
                  ),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            ],
          ),
        );
      },
    );

    // return VoleepSearchList<CustomerModel>(
    //     searchField: "dsName",
    //     endpoint: "${ApiConfig.CARCLEAN_API_URL}/customer",
    //     actions: [
    //       Container(
    //         margin: const EdgeInsets.only(right: 27),
    //         height: 33,
    //         width: 33,
    //         child: GestureDetector(
    //           child: CircleAvatar(
    //             backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    //             child: Icon(
    //               Icons.person_rounded,
    //               color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
    //               size: 20,
    //             ),
    //           ),
    //           onTap: () => Scaffold.of(context).openEndDrawer(),
    //         ),
    //       ),
    //     ],
    //     itemBuilder: (context, index, item) {
    //       return ListTile(
    //         title: Text(item.dsName),
    //         subtitle: Text(item.dsEmail ?? ""),
    //         leading: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             ClipRRect(
    //                 borderRadius: const BorderRadius.all(Radius.circular(50)),
    //                 child: Container(
    //                   width: 40,
    //                   height: 40,
    //                   alignment: AlignmentDirectional.center,
    //                   color: Theme.of(context)
    //                       .colorScheme
    //                       .surfaceTint
    //                       .withOpacity(0.5),
    //                   child: Text(item.dsName.substring(0, 1).toUpperCase()),
    //                 )),
    //           ],
    //         ),
    //         trailing: const Icon(Icons.navigate_next_rounded),
    //         onTap: () => context.push("/app/customer/${item.customerId}"),
    //       );
    //     },
    //     fromJsonT: CustomerModel.fromJson);
  }
}
