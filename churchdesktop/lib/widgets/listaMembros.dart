import 'package:churchdesktop/widgets/menu.dart';
import 'package:flutter/material.dart';

class ListaMembros extends StatefulWidget {
  const ListaMembros({super.key});

  @override
  State<ListaMembros> createState() => _ListaMembrosState();
}

class _ListaMembrosState extends State<ListaMembros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Container()],
        ),
      ),
    );
  }
}
