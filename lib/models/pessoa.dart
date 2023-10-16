// ignore_for_file: unnecessary_getters_setters

import 'dart:math';

class Pessoa {
  int? _id;
  String _nome;
  double _peso; // quilos
  double _altura; // metros
  DateTime? _nascimento;
  String? _email;
  String? _password;

  // Para CLI
  Pessoa(
    this._nome,
    this._peso,
    this._altura,
  );

  // Para Cadastro
  Pessoa.app(this._email, this._password, this._nome, this._peso, this._altura,
      this._nascimento);
  // Para registro e leitura do banco
  Pessoa.db(this._id, this._email, this._password, this._nome, this._peso,
      this._altura, this._nascimento);

  int get id => _id ?? 0;
  String get email => _email ?? "";
  String get password => _password ?? "";
  String get nome => _nome;
  double get peso => _peso;
  double get altura => _altura;
  DateTime get nascimento => _nascimento ?? DateTime.now();

  int get idade {
    DateTime today = DateTime.now();
    int idade =
        nascimento.year - today.year - 1; // -1 devido o ano não ter terminado
    if (today.month >= nascimento.month && today.day >= nascimento.day) {
      idade++;
    }

    return idade;
  }

  set id(int id) {
    _id = id;
  }

  set email(String email) {
    _email = email;
  }

  set password(String password) {
    _password = password;
  }

  set nome(String nome) {
    _nome = nome;
  }

  set peso(double peso) {
    _peso = peso;
  }

  set altura(double altura) {
    _altura = altura;
  }

  set nascimento(DateTime data) {
    _nascimento = data;
  }

  double get imc {
    return _peso / (pow(_altura, 2));
  }

  String getIMCString() {
    if (imc >= 40) {
      return 'Obesidade Grau III (mórbida)';
    }
    if (imc >= 35) {
      return 'Obesidade Grau II (severa)';
    }
    if (imc >= 30) {
      return 'Obesidade Grau I';
    }
    if (imc >= 25) {
      return 'Sobrepeso';
    }
    if (imc >= 18.5) {
      return 'Saudável';
    }
    if (imc >= 17) {
      return 'Magreza Leve';
    }
    if (imc >= 16) {
      return 'Magreza Moderada';
    }
    return 'Magreza grave';
  }

  static calcIMC(double altura, double peso) {
    return peso / (pow(altura, 2));
  }
}
