import 'package:churchdesktop/View/dashboard/dashboard.dart';
import 'package:churchdesktop/View/login/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  void verificarAutenticacao() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('authtoken');
    if (token!.isEmpty) {
      await Future.delayed(Duration(seconds: 2));
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    } else {
      await Future.delayed(Duration(seconds: 2));
      print(token);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    }
  }

  @override
  void initState() {
    super.initState();
    verificarAutenticacao();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(color: Colors.white,),
    );
  }
}
