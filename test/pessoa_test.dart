import 'package:flutter_test/flutter_test.dart';
import 'package:inicial/classes/pessoa.dart';

void main() {
  String nome = 'Teste Man';
  double peso = 80;
  double altura = 1.70;

  Pessoa pessoa = Pessoa(nome, peso, altura);
  test('Classe Pessoa/Atributos Iniciais', () {
    expect(pessoa.getNome(), nome);
    expect(pessoa.getAltura(), altura);
    expect(pessoa.getPeso(), peso);
  });

  test('Classe Pessoa/Atributos Atualizados', () {
    pessoa.setNome('Rogério');
    pessoa.setAltura(1.50);
    pessoa.setPeso(50);
    expect(pessoa.getNome(), 'Rogério');
    expect(pessoa.getAltura(), 1.50);
    expect(pessoa.getPeso(), 50);
  });

  pessoa = Pessoa(nome, peso, altura);

  test('Classe Pessoa/IMC', () {
    expect(pessoa.getIMC().toStringAsFixed(2), "27.68");
    pessoa.setPeso(125);
    expect(pessoa.getIMC().toStringAsFixed(2), "43.25");
    pessoa.setPeso(40);
    expect(pessoa.getIMC().toStringAsFixed(2), "13.84");
  });

  test('Classe Pessoa/IMC String', () {
    pessoa.setPeso(30);
    expect(pessoa.getIMCString(), "Magreza grave");

    pessoa.setPeso(48);
    expect(pessoa.getIMCString(), "Magreza Moderada");

    pessoa.setPeso(52);
    expect(pessoa.getIMCString(), "Magreza Leve");

    pessoa.setPeso(65);
    expect(pessoa.getIMCString(), "Saudável");

    pessoa.setPeso(80);
    expect(pessoa.getIMCString(), "Sobrepeso");

    pessoa.setPeso(90);
    expect(pessoa.getIMCString(), "Obesidade Grau I");

    pessoa.setPeso(110);
    expect(pessoa.getIMCString(), "Obesidade Grau II (severa)");

    pessoa.setPeso(125);
    expect(pessoa.getIMCString(), "Obesidade Grau III (mórbida)");
  });
}
