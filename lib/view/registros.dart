import 'package:flutter/material.dart';

class Registros extends StatefulWidget {
  const Registros({super.key});

  @override
  State<Registros> createState() => _RegistrosState();
}

class _RegistrosState extends State<Registros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registros')),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Table(
          border: const TableBorder(
            horizontalInside: BorderSide(width: 1),
            verticalInside: BorderSide(width: 1),
            right: BorderSide(width: 1),
            left: BorderSide(width: 1),
          ),
          columnWidths: const {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(1),
            3: FlexColumnWidth(2),
            4: FlexColumnWidth(2),
          },
          children: const [
            // Títulos
            TableRow(children: [
              TableCell(
                child: Text(
                  "Peso (kg)",
                  textAlign: TextAlign.center,
                ),
              ),
              TableCell(
                child: Text(
                  "Altura (m)",
                  textAlign: TextAlign.center,
                ),
              ),
              TableCell(
                child: Text(
                  "IMC",
                  textAlign: TextAlign.center,
                ),
              ),
              TableCell(
                child: Text(
                  "Situação",
                  textAlign: TextAlign.center,
                ),
              ),
              TableCell(
                child: Text(
                  "Data",
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
            // Conteúdo
            TableRow(
              children: [
                TableCell(
                    child: Text(
                  "80.594",
                  textAlign: TextAlign.center,
                )),
                TableCell(
                    child: Text(
                  "1.75",
                  textAlign: TextAlign.center,
                )),
                TableCell(
                    child: Text(
                  "20",
                  textAlign: TextAlign.center,
                )),
                TableCell(
                    child: Text(
                  "Saudável",
                  textAlign: TextAlign.center,
                )),
                TableCell(
                    child: Text(
                  "05/10/2023",
                  textAlign: TextAlign.center,
                )),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                    child: Text(
                  "80.594",
                  textAlign: TextAlign.center,
                )),
                TableCell(
                    child: Text(
                  "1.75",
                  textAlign: TextAlign.center,
                )),
                TableCell(
                    child: Text(
                  "20",
                  textAlign: TextAlign.center,
                )),
                TableCell(
                    child: Text(
                  "Saudável",
                  textAlign: TextAlign.center,
                )),
                TableCell(
                    child: Text(
                  "05/10/2023",
                  textAlign: TextAlign.center,
                )),
              ],
            ),
            // End
            TableRow(
              children: [
                TableCell(child: Text("")),
                TableCell(child: Text("")),
                TableCell(child: Text("")),
                TableCell(child: Text("")),
                TableCell(child: Text("")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
