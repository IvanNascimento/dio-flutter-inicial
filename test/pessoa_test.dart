import 'package:flutter_test/flutter_test.dart';
import 'package:inicial/models/pessoa.dart';

void main() {
  String nome = 'Teste Man';
  double peso = 80;
  double altura = 1.70;

  Pessoa pessoa = Pessoa(nome, peso, altura);
  test('Classe Pessoa/Atributos Iniciais', () {
    expect(pessoa.nome, nome);
    expect(pessoa.altura, altura);
    expect(pessoa.peso, peso);
  });

  test('Classe Pessoa/Atributos Atualizados', () {
    pessoa.nome = ('Rogério');
    pessoa.altura = (1.50);
    pessoa.peso = (50);
    expect(pessoa.nome, 'Rogério');
    expect(pessoa.altura, 1.50);
    expect(pessoa.peso, 50);
  });

  pessoa = Pessoa(nome, peso, altura);

  test('Classe Pessoa/IMC', () {
    expect(pessoa.imc.toStringAsFixed(2), "27.68");
    pessoa.peso = (125);
    expect(pessoa.imc.toStringAsFixed(2), "43.25");
    pessoa.peso = (40);
    expect(pessoa.imc.toStringAsFixed(2), "13.84");
  });

  test('Classe Pessoa/IMC String', () {
    pessoa.peso = (30);
    expect(pessoa.getIMCString(), "Magreza grave");

    pessoa.peso = (48);
    expect(pessoa.getIMCString(), "Magreza Moderada");

    pessoa.peso = (52);
    expect(pessoa.getIMCString(), "Magreza Leve");

    pessoa.peso = (65);
    expect(pessoa.getIMCString(), "Saudável");

    pessoa.peso = (80);
    expect(pessoa.getIMCString(), "Sobrepeso");

    pessoa.peso = (90);
    expect(pessoa.getIMCString(), "Obesidade Grau I");

    pessoa.peso = (110);
    expect(pessoa.getIMCString(), "Obesidade Grau II (severa)");

    pessoa.peso = (125);
    expect(pessoa.getIMCString(), "Obesidade Grau III (mórbida)");
  });
}
