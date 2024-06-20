import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(left: 20, top: 20),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/logotipo.png',
            width: 168,
            height: 96,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.amberAccent,
              border: Border.all(color: Colors.amberAccent, width: 10),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(children: [
              Icon(Icons.dashboard),
              SizedBox(width: 10,),
              Text('Dashboard',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),)
            ],),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent, width: 10),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(children: [
              Icon(Icons.person),
              SizedBox(width: 10,),
              Text('Ministros',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),)
            ],),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent, width: 10),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(children: [
              Icon(Icons.group_sharp),
              SizedBox(width: 10,),
              Text('Membros',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),)
            ],),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent, width: 10),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(children: [
              Icon(Icons.heat_pump),
              SizedBox(width: 10,),
              Text('Aniversariantes',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),)
            ],),
          )
        ]
      )    
    );
  }
}
