import 'package:churchdesktop/Controller/membro.controller.dart';
import 'package:churchdesktop/Controller/ministro.controller.dart';
import 'package:churchdesktop/Model/membro.model.dart';
import 'package:churchdesktop/Model/ministro.model.dart';

import 'package:churchdesktop/widgets/CommomHeader.dart';
import 'package:churchdesktop/widgets/menu.dart';
import 'package:churchdesktop/widgets/widgetModel/PaginatedTableAniversariantes.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int totalmembros = 130, totalMinistros = 10, homens = 50, mulheres = 80;

  void fetchData() async {
    List<Membro> membros = await MembroController().getAllMembros();
    setState(() {
      totalmembros = membros.length;
    });

    List<Ministro>? ministros = await MinistroController().getAllMinistros();
    setState(() {
      totalMinistros = ministros.length;
    });
  }

  @override
  void initState() {
    super.initState();
    //fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Menu(index: 1),
            ),
            Expanded(
              flex: 8,
              child: Container(
                width: 200,
                margin: EdgeInsets.only(left: 10 /*, right: 20*/),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: header(),
                    ),
                    Expanded(
                      flex: 9,
                      child: Container(
                        color: Colors.grey.withOpacity(0.4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 30),
                            Container(
                              height: 130,
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 240,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        border: Border.all(
                                          width: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Total de membros',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(height: 40),
                                          Text(
                                            totalmembros.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Container(
                                      width: 240,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        border: Border.all(
                                          width: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Total de ministros',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(height: 40),
                                          Text(
                                            totalMinistros.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Container(
                                      width: 240, 
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        border: Border.all(
                                          width: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'HOMENS',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              SizedBox(height: 40),
                                              Text(
                                                '80',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 20),
                                          Column(
                                            children: [
                                              Text(
                                                'MULHERES',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              SizedBox(height: 40),
                                              Text(
                                                '50',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                ],
                              ),
                            ),
                            SizedBox(height: 30),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 20,
                                    color: Colors.white,
                                  ),
                                  color: Colors.white,
                                ),
                                margin: EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Próximos Aniversariantes',
                                            style: TextStyle(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                            ),
                                          ),
                                          Icon(
                                            Icons.more_vert_rounded,
                                            color: Colors.grey.withOpacity(0.5),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 8,
                                      child: PaginatedtableAniversariantes(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
