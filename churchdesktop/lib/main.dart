import 'package:churchdesktop/View/dashboard/dashboard.dart';
import 'package:churchdesktop/View/login/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChurchManagementApp());
}

class ChurchManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true
      ),
      title: 'Siloé',
      debugShowCheckedModeBanner: false,
      home: Dashboard()
    );
  }
}
