import 'package:churchdesktop/widgets/CommomHeader.dart';
import 'package:churchdesktop/widgets/menu.dart';
import 'package:churchdesktop/widgets/widgetModel/PaginatedTableMinistros.dart';
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
                    margin: EdgeInsets.only(left: 10),
                    child: Column(children: [
                      Expanded(
                          flex: 1,
                          child: header()),
                      Expanded(
                          flex: 9,
                          child: Center(
                            child: Container(
                              color: Colors.grey.withOpacity(0.4),
                              child: PaginatedTableMinistros(),
                            ),
                          ))
                    ])),
              )
            ])));
  }
}
