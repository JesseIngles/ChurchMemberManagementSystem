import 'package:churchdesktop/View/search/search.dart';
import 'package:churchdesktop/widgets/listaMinistros.dart';
import 'package:churchdesktop/widgets/menu.dart';
import 'package:flutter/material.dart';

class Ministros extends StatefulWidget {
  const Ministros({super.key});

  @override
  State<Ministros> createState() => _MinistrosState();
}

class _MinistrosState extends State<Ministros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Expanded(
                flex: 2,
                child: Menu(
                  index: 2,
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                    width: 200,
                    margin: EdgeInsets.only(left: 10, top: 10, right: 20),
                    child: Column(children: [
                      Expanded(
                          flex: 1,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Search()));
                                  },
                                  child: Container(
                                      height: 40,
                                      width: 650,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                offset: Offset(0, 3),
                                                blurRadius: 7,
                                                spreadRadius: 5)
                                          ]),
                                      child: /*TextField(
                                      decoration: InputDecoration(
                                          hintText: 'Pesquise por alguém ...',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide.none),
                                          fillColor: Color(0xFFFAFAFA),
                                          filled: true),
                                    )*/
                                          Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(Icons.search),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('Pesquise...')
                                        ],
                                      )),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 5, color: Colors.green),
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(Icons.notifications),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    CircleAvatar(
                                      minRadius: 15,
                                      child: Image.asset('assets/logotipo.png'),
                                    ),
                                    SizedBox(
                                      width: 07,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Cody Fisher',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 07,
                                        ),
                                        Text(
                                          'Gerente',
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.grey),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ])),
                      Expanded(
                          flex: 9,
                          child: Container(
                            child: ListaMinistros(),
                          ))
                    ])),
              )
            ])));
  }
}
