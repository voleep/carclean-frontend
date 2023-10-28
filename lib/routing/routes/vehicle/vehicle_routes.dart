import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/typedefs/customer_id.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/vehicle_id.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/presentation/vehicle_form/vehicle_form_page.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';

class VehicleRoutes {
  static String name = "vehicle";

  final String root;

  get create => "$root/new";

  update(CustomerId id) => "$root/$id";

  VehicleRoutes.forChild({
    required String parentPath,
  }) : root = "$parentPath/$name";

  List<RouteBase> get routes => [
        GoRoute(
          parentNavigatorKey: Routes.i.navigationkey,
          path: "$root/:id",
          builder: (context, state) {
            final VehicleId? vehicleId = state.pathParameters['id'];

            return vehicleId != null
                ? VehicleFormPage(
                    vehicleId: vehicleId,
                  )
                : const Placeholder();
          },
        ),
      ];
}
