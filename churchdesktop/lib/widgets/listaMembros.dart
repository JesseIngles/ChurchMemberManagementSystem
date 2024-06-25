import 'package:churchdesktop/editation/edit.membro.dart';
import 'package:flutter/material.dart';
import 'package:churchdesktop/Controller/membro.controller.dart';
import 'package:churchdesktop/View/dashboard/dashboard.dart';
import 'package:churchdesktop/Model/membro.model.dart';

class MembroDataSource extends DataTableSource {
  final List<Membro> membros;
  final BuildContext context;

  MembroDataSource(this.membros, this.context);

  void deleteMembro(String id) async {
    try {
      if (await MembroController().deleteMembro(id)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Membro excluído com sucesso.'),
            duration: Duration(seconds: 3),
          ),
        );
        // Atualiza a lista de membros após a exclusão
        membros.removeWhere((membro) => membro.id == id);
        notifyListeners(); // Notifica a DataTable que os dados mudaram
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao excluir o membro.'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao excluir o membro: $e'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (membros.isEmpty || index >= membros.length) return null;

    final membro = membros[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(membro.codigoMembro), onDoubleTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditMember(membro: membro),
            ),
          );
        }),
        DataCell(
          Text(membro.nomeCompleto),
          onTap: () {
            deleteMembro(membro.id); // Chama o método de exclusão
          },
        ),
        DataCell(
          membro.fotografia.isNotEmpty
              ? Image.network(
                  'http://localhost:3100${membro.fotografia}',
                  width: 70,
                  height: 70,
                )
              : Container(),
        ),
        DataCell(Text(membro.phonenumber)),
        DataCell(Text(membro.localNascimento)),
        DataCell(Text(membro.dataNascimento)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => membros.length;

  @override
  int get selectedRowCount => 0;
}
