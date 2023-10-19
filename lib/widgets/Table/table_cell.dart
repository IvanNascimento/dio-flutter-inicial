import 'package:flutter/material.dart';
import 'package:inicial/constants/colors.dart';

class CustomTableCell extends StatefulWidget {
  final String _text;
  const CustomTableCell(this._text, {super.key});

  @override
  State<CustomTableCell> createState() => _CustomTableCellState();
}

class _CustomTableCellState extends State<CustomTableCell> {
  @override
  Widget build(BuildContext context) {
    return TableCell(
        child: Text(
      widget._text,
      textAlign: TextAlign.center,
      style: TextStyle(color: TextColors.InvertedColor),
    ));
  }
}
