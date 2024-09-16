import 'package:churchdesktop/Model/membro.model.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Membro> Membros = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        centerTitle: true,
        backgroundColor: Colors.grey.withOpacity(0.4),
        title: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: Offset(0, 3),
                      blurRadius: 5,
                      spreadRadius: 2)
                ],
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Pesquisar...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  fillColor: Color(0xFFFAFAFA),
                  filled: true),
            )),
      ),
      body: Container(
        color: Colors.grey.withOpacity(0.4),
        margin: EdgeInsets.only(left: 20, top: 10, right: 20),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(children: [
                ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG2WT5-lYkfhKI8s9c_72JC4-Wmn8GsUJFog&s', height: 100,fit: BoxFit.cover)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jessé Inglês', style: TextStyle(
                      fontSize: 24
                    ),),
                    SizedBox(height: 25,),
                    Row(children: [
                      Text('+244 934 526 466'),
                      SizedBox(width: 8,),
                      Text('|'),
                      SizedBox(width: 8,),
                      Text('Luanda, Kilamaba J17'),
                    ],)
                ],)
              ],),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(children: [
                ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG2WT5-lYkfhKI8s9c_72JC4-Wmn8GsUJFog&s', height: 100,fit: BoxFit.cover)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jessé Inglês', style: TextStyle(
                      fontSize: 24
                    ),),
                    SizedBox(height: 25,),
                    Row(children: [
                      Text('+244 934 526 466'),
                      SizedBox(width: 8,),
                      Text('|'),
                      SizedBox(width: 8,),
                      Text('Luanda, Kilamaba J17'),
                    ],)
                ],)
              ],),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(children: [
                ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG2WT5-lYkfhKI8s9c_72JC4-Wmn8GsUJFog&s', height: 100,fit: BoxFit.cover)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jessé Inglês', style: TextStyle(
                      fontSize: 24
                    ),),
                    SizedBox(height: 25,),
                    Row(children: [
                      Text('+244 934 526 466'),
                      SizedBox(width: 8,),
                      Text('|'),
                      SizedBox(width: 8,),
                      Text('Luanda, Kilamaba J17'),
                    ],)
                ],)
              ],),
            ),
          ],
        ),
      ),
      
    );
  }
}
