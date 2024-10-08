import 'package:flutter/material.dart';
import 'package:churchdesktop/Model/membro.model.dart';
import 'package:churchdesktop/Controller/membro.controller.dart';

class PaginatedTableDemo extends StatefulWidget {
  @override
  _PaginatedTableDemoState createState() => _PaginatedTableDemoState();
}

class _PaginatedTableDemoState extends State<PaginatedTableDemo> {
  List<Membro> _membros = [];
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
        _membros = membros;
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

  void deleteMembro(String id) async {
    try {
      await _membroController.deleteMembro(id);
      await fetchMembros(); // Atualiza a lista após a exclusão
      showMessage('Membro $id excluído com sucesso.');
    } catch (e) {
      showMessage('Erro ao excluir membro: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _membros.isEmpty
              ? Center(child: Text('Nenhum dado disponível'))
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('Código Membro')),
                      DataColumn(label: Text('Nome Completo')),
                      DataColumn(label: Text('Fotografia')),
                      DataColumn(label: Text('Telefone')),
                      DataColumn(label: Text('Local Nascimento')),
                      DataColumn(label: Text('Data Nascimento')),
                      DataColumn(label: Text('Ações')),
                    ],
                    rows: _membros
                        .map(
                          (membro) => DataRow(
                            cells: [
                              DataCell(Text(membro.codigoMembro)),
                              DataCell(Text(membro.nomeCompleto)),
                              DataCell(Image.network(membro.fotografia)),
                              DataCell(Text(membro.phonenumber)),
                              DataCell(Text(membro.localNascimento)),
                              DataCell(Text(membro.dataNascimento.toString())),
                              DataCell(
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () => deleteMembro(membro.id),
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
    );
  }
}
