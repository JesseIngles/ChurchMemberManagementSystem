import 'package:flutter/material.dart';

class ListaMinistros extends StatefulWidget {
  const ListaMinistros({super.key});

  @override
  State<ListaMinistros> createState() => _ListaMinistrosState();
}

class _ListaMinistrosState extends State<ListaMinistros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.withOpacity(0.5),
        child: Column(
          children: [Container()],
        ),
      ),
    );
  }
}
