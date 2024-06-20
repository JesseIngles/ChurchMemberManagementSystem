import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  final GraphQLClient _client;

  GraphQLService(this._client);

  Future<QueryResult> performQuery(String query, {Map<String, dynamic>? variables}) async {
    final options = QueryOptions(
      document: gql(query),
      variables: variables ?? {},
    );
    return await _client.query(options);
  }

  Future<QueryResult> performMutation(String mutation, {Map<String, dynamic>? variables}) async {
    final options = MutationOptions(
      document: gql(mutation),
      variables: variables ?? {},
    );
    return await _client.mutate(options);
  }
}
