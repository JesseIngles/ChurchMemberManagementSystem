import 'package:churchdesktop/widgets/listaMembros.dart';
import 'package:flutter/material.dart';
import 'package:churchdesktop/Model/membro.model.dart';
import 'package:churchdesktop/Controller/membro.controller.dart';
import 'package:intl/intl.dart';

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

      // Filtrar membros cujo aniversário está a menos de 7 dias
      for (var item in membros) {
        // Converter data de nascimento para DateTime
        DateTime dataNascimento = _parseDataNascimento(item.dataNascimento);

        // Calcular diferença em dias entre hoje e a data de nascimento
        int diferencaDias = DateTime.now().difference(dataNascimento).inDays;

        // Filtrar se a diferença for menor que 7 dias
        if (diferencaDias < 360) {
          filtro.add(item);
        }
      }

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

  DateTime _parseDataNascimento(String dataNascimento) {
    // Formato esperado dd/mm/yyyy
    List<String> partes = dataNascimento.split('/');
    if (partes.length != 3) {
      throw FormatException("Formato de data inválido: $dataNascimento");
    }
    DateTime data = DateFormat('dd/MM/yyyy').parseStrict(dataNascimento);

    // Formatar para outro formato, se necessário
    //DateTime dataFormatada = DateFormat('yyyy-MM-dd').format(data);
    return data;
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
