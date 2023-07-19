import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:voleep_carclean_frontend/core/config/ApiConfig.dart';
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/modules/customer/data/dtos/create_customer_dto.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/typedefs/customer_id.dart';

class CustomerRepository {
  final HttpClient http;
  final GraphQLClient graphQLClient;

  CustomerRepository({required this.http, required this.graphQLClient});

  get endpoint {
    return "${ApiConfig.CARCLEAN_API_URL}/customer";
  }

  Future<CustomerModel?> findById({required CustomerId customerId}) async {
    // const String getCustomerById = r'''
    //   query GetCustomerById($customerId: String!) {
    //     getCustomerById(customerId: $customerId) {
    //       dsName
    //     }
    //   }
    // ''';

    // final QueryOptions options = QueryOptions(
    //   document: gql(getCustomerById),
    //   variables: <String, dynamic>{
    //     'customerId': customerId,
    //   },
    // );

    // final QueryResult result = await graphQLClient.query(options);

    // if (result.hasException) {
    //   print(result.exception.toString());
    // }
    // if (result.data == null) {
    //   return null;
    // }

    final response = await http.get("$endpoint/$customerId");

    if (response.data == null) {
      return null;
    }

    return CustomerModel.fromJson(response.data!);
  }

  Future<CustomerModel?> saveOrUpdate(CreateCustomerDTO createCustomerDTO) async {
    if (createCustomerDTO.idCustomer == null) {
      return save(createCustomerDTO: createCustomerDTO);
    }

    return update(createCustomerDTO: createCustomerDTO);
  }

  Future<CustomerModel?> save({required CreateCustomerDTO createCustomerDTO}) async {
    final response = await http.post(endpoint, data: createCustomerDTO.toJson());

    if (response.data == null) {
      return null;
    }

    return CustomerModel.fromJson(response.data!);
  }

  Future<CustomerModel?> update({required CreateCustomerDTO createCustomerDTO}) async {
    final response = await http.put(endpoint, data: createCustomerDTO.toJson());

    if (response.data == null) {
      return null;
    }

    return CustomerModel.fromJson(response.data!);
  }
}
