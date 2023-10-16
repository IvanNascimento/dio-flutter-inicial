// ignore_for_file: constant_identifier_names

import 'package:inicial/enums/database_tables.dart';
import 'package:inicial/models/pessoa.dart';
import 'package:inicial/repositories/sqlitedatabase.dart';
import 'package:sqflite/sqflite.dart';

class AppStorage {
  late Database _storage;

  AppStorage() {
    _init();
  }

  void _init() async {
    _storage = await SQLiteDataBase().getDB();
  }

  Future<int> insert(TABLES table, Pessoa pessoa) async {
    return await _storage.rawInsert('');
  }

  Future<List<Map<String, Object?>>> select(TABLES table, int id) async {
    return _storage.rawQuery("");
  }

  Future<int> update(TABLES table, int id) async {
    return await _storage.rawUpdate('');
  }

  Future<int> destroy(TABLES table, int id) async {
    return await _storage.rawDelete('');
  }
}
