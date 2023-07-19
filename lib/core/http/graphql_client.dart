import 'package:gql_dio_link/gql_dio_link.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:voleep_carclean_frontend/core/config/ApiConfig.dart';
import 'package:voleep_carclean_frontend/core/http/providers/dio_provider.dart';
import 'package:voleep_carclean_frontend/core/http/providers/http_interceptor_provider.dart';
part 'graphql_client.g.dart';

@Riverpod(keepAlive: true)
GraphQLClient graphQLClient(GraphQLClientRef ref) {
  final dio = ref.read(dioProvider);
  dio.interceptors.add(ref.read(httpInterceptorProvider));

  final link = Link.from([DioLink("${ApiConfig.CARCLEAN_API_URL}/graphql", client: dio)]);

  return GraphQLClient(
    cache: GraphQLCache(),
    link: link,
  );
}
