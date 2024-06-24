import 'package:churchdesktop/Model/user.model.dart';
import 'package:churchdesktop/Util/graphql.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController with ChangeNotifier {
  String _loginResponse = '';
  GraphQLClient client = GraphQLConfig.clientToQuery();
  String? get loginResponse => _loginResponse;

  Future<bool> login(String username, String password) async {
    const String query = r'''
      query LoginUser($username: String!, $password: String!) {
        LoginUser(username: $username, password: $password)
      }
    ''';

    final QueryOptions options = QueryOptions(
      document: gql(query),
      fetchPolicy: FetchPolicy.cacheAndNetwork,
      variables: <String, dynamic>{
        'username': username,
        'password': password,
      },
    );

    final QueryResult result = await client.query(options);
    print(result);
    if (result.hasException) {
      print(result.exception);
      return false;
    }

    _loginResponse = result.data?['LoginUser'] as String;
    if (_loginResponse.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('authtoken', _loginResponse);

      return true;
    } else {
      return false;
    }
  }
}
