import 'package:churchdesktop/Model/user.model.dart';
import 'package:churchdesktop/Util/graphql.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class UserController with ChangeNotifier {
  User? _user;
  GraphQLClient client = GraphQLConfig.clientToQuery();
  //User? get user = _user;
}
