import 'package:churchdesktop/Controller/ministro.controller.dart';
import 'package:churchdesktop/Model/ministro.model.dart';
import 'package:churchdesktop/widgets/listaMembros.dart';
import 'package:churchdesktop/widgets/listaMinistros.dart';
import 'package:flutter/material.dart';
import 'package:churchdesktop/Model/membro.model.dart';
import 'package:churchdesktop/Controller/membro.controller.dart';

class PaginatedTableMinistros extends StatefulWidget {
  @override
  _PaginatedTableMinistrosState createState() => _PaginatedTableMinistrosState();
}

class _PaginatedTableMinistrosState extends State<PaginatedTableMinistros> {
  MinistroDataSource? _membroDataSource;
  final int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  bool _isLoading = true;
  final MinistroController _ministroController = MinistroController();

  @override
  void initState() {
    super.initState();
    fetchMembros();
  }

  Future<void> fetchMembros() async {
    try {
      List<Ministro> minitros = await _ministroController.getAllMinistros();
      setState(() {
        _membroDataSource = MinistroDataSource(minitros);
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
          ) : Center(child: Text('Nenhum dado disponível')),
    );
  }
}
