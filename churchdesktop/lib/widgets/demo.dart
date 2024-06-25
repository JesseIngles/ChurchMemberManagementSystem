import 'package:churchdesktop/widgets/listaMembros.dart';
import 'package:churchdesktop/widgets/listaMinistros.dart';
import 'package:flutter/material.dart';
import 'package:churchdesktop/Model/membro.model.dart';
import 'package:churchdesktop/Controller/membro.controller.dart';

class PaginatedTableDemo extends StatefulWidget {
  @override
  _PaginatedTableDemoState createState() => _PaginatedTableDemoState();
}

class _PaginatedTableDemoState extends State<PaginatedTableDemo> {
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
      setState(() {
        _membroDataSource = MembroDataSource(membros, context);
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
