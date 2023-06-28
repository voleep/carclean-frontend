import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/config/ApiConfig.dart';
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/core/http/providers/http_client_provider.dart';
import 'package:voleep_carclean_frontend/modules/product/application/dtos/product_request_dto.dart';
import 'package:voleep_carclean_frontend/modules/product/domain/models/product_model.dart';

part 'product_service.g.dart';

@riverpod
ProductService productService(ProductServiceRef ref) => ProductService(http: ref.watch(httpClientProvider));

class ProductService {
  ProductService({required this.http});

  final HttpClient http;

  get endpoint => "${ApiConfig.CARCLEAN_API_URL}/product";

  Future<ProductModel?> findById(String productId) async {
    final response = await http.get("$endpoint/$productId");

    if (response.data == null) {
      return null;
    }

    return ProductModel.fromJson(response.data!);
  }

  Future<ProductModel?> save(ProductRequestDTO productRequestModel) async {
    final response = await http.post(endpoint, data: productRequestModel.toJson());

    if (response.data == null) {
      return null;
    }

    return ProductModel.fromJson(response.data!);
  }

  Future<ProductModel?> update(ProductRequestDTO productRequestDTO) async {
    final response = await http.put(endpoint, data: productRequestDTO.toJson());

    if (response.data == null) {
      return null;
    }

    return ProductModel.fromJson(response.data!);
  }
}
