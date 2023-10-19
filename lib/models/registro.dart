import 'package:inicial/models/pessoa.dart';

class Registro extends Pessoa {
  final DateTime _data;

  Registro(double peso, double altura, this._data) : super("", peso, altura);

  String get data => '${_data.year}-${_data.month}-${_data.day}';

  String get pesoStr => peso.toString();
  String get alturaStr => altura.toString();
  String get imcStr => imc.toStringAsFixed(2);
  String get saude => getIMCString();
}
