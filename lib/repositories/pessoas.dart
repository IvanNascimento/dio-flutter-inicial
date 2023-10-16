// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/cupertino.dart';
import 'package:inicial/models/pessoa.dart';

class _RepositoryData {
  final String _id = UniqueKey().toString();
  Pessoa _pessoa;
  DateTime _data;

  _RepositoryData(this._data, this._pessoa);

  String get id => _id;
  Pessoa get pessoa => _pessoa;
  DateTime get data => _data;

  set pessoa(Pessoa pessoa) {
    _pessoa = pessoa;
  }

  set data(DateTime data) {
    _data = data;
  }
}

class PessoaRepository {
  final List<_RepositoryData> _repositoryData = [];

  Future<void> adicionar(Pessoa pessoa, DateTime? data) async {
    _repositoryData.add(_RepositoryData(data ?? DateTime.now(), pessoa));
  }

  Future<void> alterar(String id, DateTime? data, String? nome, double? peso,
      double? altura) async {
    int toChange = _repositoryData.indexWhere((element) => element.id == id);
    data != null ? _repositoryData[toChange].data = data : null;
    nome != null ? _repositoryData[toChange].pessoa.nome = nome : null;
    peso != null ? _repositoryData[toChange].pessoa.peso = peso : null;
    altura != null ? _repositoryData[toChange].pessoa.altura = altura : null;
  }

  Future<void> remover(String id) async {
    _repositoryData.removeWhere((element) => element.id == id);
  }
}
