class Pessoa {
  String _nome;
  double _peso; // quilos
  double _altura; // metros

  Pessoa(this._nome, this._peso, this._altura);

  String getNome() {
    return _nome;
  }

  double getPeso() {
    return _peso;
  }

  double getAltura() {
    return _altura;
  }

  void setNome(String nome) {
    _nome = nome;
  }

  void setPeso(double peso) {
    _peso = peso;
  }

  void setAltura(double altura) {
    _altura = altura;
  }

  double getIMC() {
    return _peso / (_altura * _altura);
  }

  String getIMCString() {
    double imc = getIMC();
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
}
