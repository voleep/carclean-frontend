import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/constants/strings.dart';
import 'package:voleep_carclean_frontend/core/exceptions/http_exception.dart';
import 'package:voleep_carclean_frontend/core/exceptions/repository_exception.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/modules/product/data/models/product_model.dart';
import 'package:voleep_carclean_frontend/modules/product/data/models/create_product_model.dart';
import 'package:voleep_carclean_frontend/modules/product/domain/entities/product.dart';
import 'package:voleep_carclean_frontend/core/config/ApiConfig.dart';
import 'package:voleep_carclean_frontend/shared/models/generic_response_model.dart';

part 'product_repository.g.dart';

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) => ProductRepository(
      http: ref.read(httpClientProvider),
    );

class ProductRepository {
  final HttpClient http;

  final String endpoint = "${ApiConfig.CARCLEAN_API_URL}/product";

  ProductRepository({required this.http});

  Future<Either<RepositoryException, Product>> findById(String productId) async {
    final getProductResult = await http.get<ProductModel>(
      "$endpoint/$productId",
      fromJsonT: ProductModel.fromJson,
    );

    switch (getProductResult) {
      case Success(value: GenericResponse(:final data)):
        if (data == null) {
          return Failure(RepositoryException(message: Strings.produtoNaoEncontrado), StackTrace.current);
        }

        return Success(
          Product(
            productId: data.productId,
            code: data.code,
            description: data.description,
            price: data.price,
            availableStock: data.availableStock,
            pcCommission: data.pcCommission,
            situation: data.situation,
          ),
        );

      case Failure(:final exception, :final stackTrace):
        if (exception is HttpBadResponseException) {
          return Failure(
            RepositoryException(message: exception.message ?? Strings.erroAoCarregarDados),
            stackTrace,
          );
        }

        return Failure(
          RepositoryException(message: Strings.erroAoCarregarDados),
          stackTrace,
        );
    }
  }

  Future<Either<RepositoryException, Product>> saveOrUpdate(CreateProductModel createProductModel) async {
    if (createProductModel.productId != null) {
      return update(createProductModel);
    }
    return save(createProductModel);
  }

  Future<Either<RepositoryException, Product>> save(CreateProductModel createProductModel) async {
    final createProdutResult = await http.post<ProductModel>(
      endpoint,
      data: createProductModel.toJson(),
      fromJsonT: ProductModel.fromJson,
    );

    switch (createProdutResult) {
      case Success(value: GenericResponse(:final data)):
        if (data == null) {
          return Failure(RepositoryException(message: Strings.erroAoSalvarDados), StackTrace.current);
        }

        return Success(
          Product(
            productId: data.productId,
            code: data.code,
            description: data.description,
            price: data.price,
            availableStock: data.availableStock,
            pcCommission: data.pcCommission,
            situation: data.situation,
          ),
        );

      case Failure(:final exception, :final stackTrace):
        if (exception is HttpBadResponseException) {
          return Failure(
            RepositoryException(message: exception.message ?? Strings.erroAoSalvarDados),
            stackTrace,
          );
        }

        return Failure(
          RepositoryException(message: Strings.erroAoSalvarDados),
          stackTrace,
        );
    }
  }

  Future<Either<RepositoryException, Product>> update(CreateProductModel createProductModel) async {
    final updateProdutResult = await http.put<ProductModel>(
      endpoint,
      data: createProductModel.toJson(),
      fromJsonT: ProductModel.fromJson,
    );

    switch (updateProdutResult) {
      case Success(value: GenericResponse(:final data)):
        if (data == null) {
          return Failure(RepositoryException(message: Strings.erroAoSalvarDados), StackTrace.current);
        }

        return Success(
          Product(
            productId: data.productId,
            code: data.code,
            description: data.description,
            price: data.price,
            availableStock: data.availableStock,
            pcCommission: data.pcCommission,
            situation: data.situation,
          ),
        );

      case Failure(:final exception, :final stackTrace):
        if (exception is HttpBadResponseException) {
          return Failure(
            RepositoryException(message: exception.message ?? Strings.erroAoSalvarDados),
            stackTrace,
          );
        }

        return Failure(
          RepositoryException(message: Strings.erroAoSalvarDados),
          stackTrace,
        );
    }
  }
}
