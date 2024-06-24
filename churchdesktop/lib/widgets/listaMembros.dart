import 'package:flutter/material.dart';
import 'package:churchdesktop/Model/membro.model.dart';

class MembroDataSource extends DataTableSource {
  final List<Membro> membros;

  MembroDataSource(this.membros);

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (membros.isEmpty || index >= membros.length) return null;

    final membro = membros[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(membro.codigoMembro)),
        DataCell(Text(membro.nomeCompleto)),
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
