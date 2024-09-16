import 'package:churchdesktop/View/registration/register.membro.dart';
import 'package:churchdesktop/View/search/search.dart';
import 'package:flutter/material.dart';

class header extends StatelessWidget {
  const header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Search(),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(left: 20),
              height: 40,
              width: 650,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    offset: Offset(0, 3),
                    blurRadius: 7,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 10),
                  Icon(Icons.search),
                  SizedBox(width: 10),
                  Text('Pesquise...'),
                ],
              ),
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterMember(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 5,
                      color: Colors.green,
                    ),
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 15),
              GestureDetector(
                  child: Icon(Icons.notifications),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: Colors.amber,
                          
                          icon: Icon(Icons.notifications),
                          actions: [
                            Text('Fechar')
                          ],
                          content:Container(
                            height: 250,
                            child: ListView(children: [
                                Text('loren ipsuin loren ipsuhn'),
                                SizedBox(height: 10,),
                                Text('loren ipsuin loren ipsuhn'),
                                SizedBox(height: 10,),
                                Text('loren ipsuin loren ipsuhn'),
                                SizedBox(height: 10,),
                                                  ],),
                          ),)
                    );
                  }),
              SizedBox(width: 40),
              Icon(Icons.person),
              SizedBox(width: 7),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Jessé Inglês',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 1),
                  Text(
                    'Secretário',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
        ],
      ),
    );
  }
}
