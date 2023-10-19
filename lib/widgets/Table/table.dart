// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:inicial/constants/colors.dart';
import 'package:inicial/models/registro.dart';
import 'package:inicial/widgets/Table/table_cell.dart';

class CustomTable extends StatefulWidget {
  final List<Registro> children;

  final Map<String, String> _headers = {
    "peso": "Peso (kg)",
    "altura": "Altura (m)",
    "imc": "IMC",
    "saude": "Situação",
    "data": "Data"
  };

  CustomTable({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> output = [];
    output.add(widget._headers);

    for (Registro e in widget.children) {
      output.add({
        "peso": e.pesoStr,
        "altura": e.alturaStr,
        "imc": e.imcStr,
        "saude": e.saude,
        "data": e.data
      });
    }

    output.add(widget._headers);

    return Table(
        border: TableBorder(
          horizontalInside: BorderSide(
            width: 1,
            color: TableColors.invertedColor,
          ),
          verticalInside: BorderSide(
            width: 1,
            color: TableColors.invertedColor,
          ),
          right: BorderSide(
            width: 1,
            color: TableColors.invertedColor,
          ),
          left: BorderSide(
            width: 1,
            color: TableColors.invertedColor,
          ),
        ),
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(1),
          3: FlexColumnWidth(2),
          4: FlexColumnWidth(2),
        },
        children: output
            .map((e) => TableRow(children: [
                  CustomTableCell(e['peso']!),
                  CustomTableCell(e['altura']!),
                  CustomTableCell(e['imc']!),
                  CustomTableCell(e['saude']!),
                  CustomTableCell(e['data']!),
                ]))
            .toList());
  }
}
