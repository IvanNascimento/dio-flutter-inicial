import 'package:inicial/enums/database_registros.dart';
import 'package:inicial/enums/database_tables.dart';
import 'package:inicial/models/registro.dart';
import 'package:inicial/repositories/sqlitedatabase.dart';
import 'package:sqflite/sqflite.dart';

class RegistroSQLiteRepository {
  Database? db;

  RegistroSQLiteRepository() {
    _init();
  }

  Future<List<Registro>> obterDados() async {
    List<Registro> usuarios = [];
    var db = await SQLiteDataBase().getDB();
    List<Map<String, dynamic>> result =
        await db.rawQuery('SELECT * FROM ${TABLES.REGISTROS.str};');
    for (var element in result) {
      usuarios.add(Registro(
          element['peso'], element['altura'], DateTime.parse(element['data'])));
    }

    return usuarios;
  }

  Future<void> salvar(Registro regis) async {
    if (db == null) {
      await _init();
    }
    await db!.rawInsert(
        'INSERT INTO ${TABLES.REGISTROS.str} (${REGISTROS.colunas}) values(?,?,?,?,?);',
        [null, regis.peso, regis.altura, regis.data, 2]);
  }

  Future<void> atualizar(String data,
      {String? peso, double? altura, double? imc}) async {
    String queryStr = """
        UPDATE ${TABLES.REGISTROS.str} SET peso = '$peso', altura = '$altura', imc = '$imc' WHERE data = '$data';
        """;
    if (db == null) {
      await _init();
    }
    await db!.rawInsert(queryStr);
  }

  Future<void> remover(String data) async {
    if (db == null) {
      await _init();
    }
    await db!
        .rawInsert('DELETE FROM ${TABLES.REGISTROS.str} WHERE data = "$data";');
  }

  Future<void> _init() async {
    db = await SQLiteDataBase().getDB();
  }
}
