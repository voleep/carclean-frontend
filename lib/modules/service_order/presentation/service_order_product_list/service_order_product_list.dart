import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/models/service_order_product_model.dart';

part 'service_order_product_list.g.dart';

@riverpod
class SelectedProductList extends _$SelectedProductList {
  @override
  List<ServiceOrderProductModel> build() {
    return [];
  }
}
