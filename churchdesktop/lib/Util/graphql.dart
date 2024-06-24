import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';


class GraphQLConfig {
  static HttpLink httpLink = HttpLink('http://localhost:3100/graphql');

  static GraphQLClient clientToQuery() {
   
    return GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()), 
      link: httpLink,
    );
  }
}
