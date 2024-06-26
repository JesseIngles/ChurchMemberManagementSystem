import 'package:churchdesktop/View/login/login.dart';
import 'package:churchdesktop/View/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.initFlutter();
  //if (!Hive.isBoxOpen('graphqlCache')) {

  //}*/
  runApp(ChurchManagementApp());
}

class ChurchManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(useMaterial3: true),
        title: 'Siloé',
        debugShowCheckedModeBanner: false,
        home: const Login());
  }
}
