import 'package:churchdesktop/widgets/menu.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {

  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: Menu(),),
            Expanded(flex: 8, 
            child: Container(
              width: 200,
              margin: EdgeInsets.only(left: 10, top:40),
              child: Column(
                children: [
                  Row(
                      children: [
                        Container(
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Olá Jessé'),
                              Text("Sistema de Gestão de membros Siloé")
                            ],
                          ),
                        ),
                        Container(
                          width: 200,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(0, 3),
                                    blurRadius: 7,
                                    spreadRadius: 5
                                  )
                                ]
                            ),
                            child: TextField(
                              
                              decoration: InputDecoration(
                                  hintText: 'Nome Completo',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none),
                                  fillColor: Color(0xFFFAFAFA),
                                  filled: true),
                            ))
                      ],
                    ),
                  Container()
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}