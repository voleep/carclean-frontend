import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/core/config/ApiConfig.dart';
import 'package:voleep_carclean_frontend/shared/responsive/responsive.dart';
import 'package:voleep_carclean_frontend/shared/voleep-search/domain/models/voleep_search_family_model.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_bar/search_bar.dart';

class VehicleListPage extends StatelessWidget {
  final _searchFamilyModel = VoleepSearchOptionsModel(
    endpoint: '${ApiConfig.CARCLEAN_API_URL}/vehicle',
    orderField: 'licensePlate',
  );

  VehicleListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Column(
      children: [
        Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Visibility(
              visible: isDesktop,
              child: SizedBox(
                height: 56,
                child: Card(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  elevation: 0,
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text("Valdecir"),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
            child: Card(
          elevation: 0,
          margin: const EdgeInsets.only(top: 12),
          color: Theme.of(context).colorScheme.surface,
          child: Container(),
        ))
      ],
    );
  }
}
