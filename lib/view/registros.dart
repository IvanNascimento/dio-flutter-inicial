import 'package:flutter/material.dart';
import 'package:inicial/constants/colors.dart';
import 'package:inicial/models/registro.dart';
import 'package:inicial/widgets/Table/table.dart';

class Registros extends StatefulWidget {
  final List<Registro> data;
  const Registros(this.data, {super.key});

  @override
  State<Registros> createState() => _RegistrosState();
}

class _RegistrosState extends State<Registros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: BackGroundColors.defaultColor,
          title: Center(
              child: Text(
            'Registros',
            style: TextStyle(color: TextColors.InvertedColor),
          ))),
      backgroundColor: BackGroundColors.defaultColor,
      body: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: CustomTable(
            children: widget.data,
          )),
    );
  }
}
