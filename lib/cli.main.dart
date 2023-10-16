// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:inicial/models/pessoa.dart';

void main(List<String> args) {
  print('Informe seu nome: ');
  String nome = stdin.readLineSync(encoding: utf8)!;

  print('Informe seu peso: (kg)');
  double peso = double.parse(stdin.readLineSync(encoding: utf8)!);

  print('Informe sua altura: (m)');
  double altura = double.parse(stdin.readLineSync(encoding: utf8)!);

  Pessoa pessoa = Pessoa(nome, peso, altura);

  print('Olá ${pessoa.nome}!');
  print('Considerando seu peso e altura...');
  print('Você se encontra ${pessoa.getIMCString()}');
}
