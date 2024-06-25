import 'package:flutter/material.dart';
import 'package:churchdesktop/Model/ministro.model.dart';
import 'package:churchdesktop/Controller/ministro.controller.dart';

class PaginatedTableMinistros extends StatefulWidget {
  @override
  _PaginatedTableMinistrosState createState() =>
      _PaginatedTableMinistrosState();
}

class _PaginatedTableMinistrosState extends State<PaginatedTableMinistros> {
  List<Ministro> _ministros = [];
  bool _isLoading = true;
  final MinistroController _ministroController = MinistroController();

  @override
  void initState() {
    super.initState();
    fetchMinistros();
  }

  Future<void> fetchMinistros() async {
    try {
      List<Ministro> ministros =
          await _ministroController.getAllMinistros();
      setState(() {
        _ministros = ministros;
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

  void deleteMinistro(String id) async {
    try {
      await _ministroController.deleteMinistro(id);
      await fetchMinistros(); // Atualiza a lista após a exclusão
      showMessage('Ministro $id excluído com sucesso.');
    } catch (e) {
      showMessage('Erro ao excluir ministro: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _ministros.isEmpty
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
                    rows: _ministros
                        .map(
                          (ministro) => DataRow(
                            cells: [
                              DataCell(Text(ministro.membro.codigoMembro)),
                              DataCell(Text(ministro.membro.nomeCompleto)),
                              DataCell(Image.network(ministro.membro.fotografia)),
                              DataCell(Text(ministro.membro.phonenumber)),
                              DataCell(Text(ministro.membro.localNascimento)),
                              DataCell(
                                Text(ministro.membro.dataNascimento.toString()),
                              ),
                              DataCell(
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () => deleteMinistro(ministro.id),
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
