import 'package:churchdesktop/widgets/listaMembros.dart';
import 'package:churchdesktop/widgets/listaMinistros.dart';
import 'package:flutter/material.dart';
import 'package:churchdesktop/Model/membro.model.dart';
import 'package:churchdesktop/Controller/membro.controller.dart';

class PaginatedtableAniversariantes extends StatefulWidget {
  @override
  _PaginatedtableAniversariantesState createState() =>
      _PaginatedtableAniversariantesState();
}

class _PaginatedtableAniversariantesState
    extends State<PaginatedtableAniversariantes> {
  MembroDataSource? _membroDataSource;
  final int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  bool _isLoading = true;
  final MembroController _membroController = MembroController();

  @override
  void initState() {
    super.initState();
    fetchMembros();
  }

  Future<void> fetchMembros() async {
    try {
      List<Membro> membros = await _membroController.getAllMembros();
      List<Membro> filtro = [];
      for (var item in membros) {
        String dataEntrada = "10/08/2006";

        List<String> partes = item.dataNascimento.split('/');
        String dataFormatada = '${partes[2]}-${partes[1]}-${partes[0]}';

        DateTime data = DateTime.parse(dataFormatada);

        if ((DateTime.now().difference(data).inDays) < 7) {
          filtro.add(item);
        }
      }
      setState(() {
        _membroDataSource = MembroDataSource(filtro);
        _isLoading = false;
      });
    } catch (e) {
      showMessage(e.toString());
      setState(() {
        _isLoading = false;
      });
    }
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _membroDataSource != null
              ? SingleChildScrollView(
                  child: PaginatedDataTable(
                    rowsPerPage: _rowsPerPage,
                    columns: [
                      DataColumn(label: Text('Código Membro')),
                      DataColumn(label: Text('Nome Completo')),
                      DataColumn(label: Text('Fotografia')),
                      DataColumn(label: Text('Telefone')),
                      DataColumn(label: Text('Local Nascimento')),
                      DataColumn(label: Text('Data Nascimento')),
                    ],
                    source: _membroDataSource!,
                  ),
                )
              : Center(child: Text('Nenhum dado disponível')),
    );
  }
}
