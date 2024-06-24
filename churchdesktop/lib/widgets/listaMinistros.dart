import 'package:churchdesktop/Model/ministro.model.dart';
import 'package:flutter/material.dart';
import 'package:churchdesktop/Model/membro.model.dart';

class MinistroDataSource extends DataTableSource {
  final List<Ministro> ministros;

  MinistroDataSource(this.ministros);

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (ministros.isEmpty || index >= ministros.length) return null;

    final ministro = ministros[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(ministro.membro.codigoMembro)),
        DataCell(Text(ministro.membro.nomeCompleto)),
        DataCell(
          ministro.membro.fotografia.isNotEmpty
              ? Image.network(
                  'http://localhost:3100${ministro.membro.fotografia}',
                  width: 70,
                  height: 70,
                )
              : Container(),
        ),
        DataCell(Text(ministro.membro.phonenumber)),
        DataCell(Text(ministro.membro.localNascimento)),
        DataCell(Text(ministro.membro.dataNascimento)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => ministros.length;

  @override
  int get selectedRowCount => 0;
}
