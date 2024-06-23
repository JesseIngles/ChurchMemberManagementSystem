import 'package:churchdesktop/View/dashboard/dashboard.dart';
import 'package:churchdesktop/View/membros/membros.dart';
import 'package:churchdesktop/View/ministros/ministros.dart';
import 'package:churchdesktop/widgets/listaMembros.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  int index;
  Menu({super.key, required this.index});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        margin: EdgeInsets.only(left: 20, top: 20),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(children: [
          Image.asset(
            'assets/logotipo.png',
            width: 168,
            height: 96,
          ),
          GestureDetector(
            onTap: () {
              if (widget.index != 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: (widget.index == 1) ? Colors.amberAccent : null,
                  border: (widget.index == 1)
                      ? Border.all(color: Colors.amberAccent, width: 10)
                      : Border.all(color: Colors.transparent, width: 10),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Icon(Icons.dashboard),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Dashboard',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (widget.index != 2) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Ministros()));
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: (widget.index == 2) ? Colors.amberAccent : null,
                  border: (widget.index == 2)
                      ? Border.all(color: Colors.amberAccent, width: 10)
                      : Border.all(color: Colors.transparent, width: 10),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Ministros',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (widget.index != 3) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Membros()));
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: (widget.index == 3) ? Colors.amberAccent : null,
                  border: (widget.index == 3)
                      ? Border.all(color: Colors.amberAccent, width: 10)
                      : Border.all(color: Colors.transparent, width: 10),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Icon(Icons.group_sharp),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Membros',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.index = 4;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent, width: 10),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Icon(Icons.heat_pump),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Aniversariantes',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
