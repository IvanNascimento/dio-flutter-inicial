import 'package:inicial/enums/database_tables.dart';
import 'package:inicial/enums/database_users.dart';
import 'package:inicial/models/pessoa.dart';
import 'package:inicial/repositories/sqlitedatabase.dart';
import 'package:sqflite/sqflite.dart';

class UserSQLiteRepository {
  Database? db;

  UserSQLiteRepository() {
    _init();
  }

  Future<List<Pessoa>> obterDados() async {
    List<Pessoa> usuarios = [];
    var db = await SQLiteDataBase().getDB();
    List<Map<String, dynamic>> result =
        await db.rawQuery('SELECT * FROM ${TABLES.USERS.str};');
    for (var element in result) {
      usuarios.add(Pessoa.db(
          element['id'],
          element['email'],
          element['senha'],
          element['nome'],
          element['peso'],
          element['altura'],
          element['nascimento']));
    }

    return usuarios;
  }

  Future<Pessoa> obterPessoa(String email) async {
    if (db == null) {
      await _init();
    }
    List<Map<String, Object?>> result = await db!
        .rawQuery('SELECT * FROM ${TABLES.USERS.str} WHERE email = "$email";');

    return Pessoa.db(
        int.parse(result[0]["id"].toString()),
        result[0]["email"].toString(),
        result[0]["senha"].toString(),
        result[0]["nome"].toString(),
        double.parse(result[0]["peso"].toString()),
        double.parse(result[0]["altura"].toString()),
        DateTime(2000));
  }

  Future<void> salvar(Pessoa pessoa) async {
    if (db == null) {
      await _init();
    }
    await db!.rawInsert(
        'INSERT INTO ${TABLES.USERS.str} (${USERS.colunas}) values(?, ?,?,?,?,?,?);',
        [
          null,
          pessoa.email,
          pessoa.password,
          pessoa.nome,
          pessoa.peso,
          pessoa.altura,
          "${pessoa.nascimento.year}-${pessoa.nascimento.month}-${pessoa.nascimento.day}"
        ]);
  }

  Future<void> atualizar(String email, {String? nome, double? altura}) async {
    String queryStr = """
        UPDATE ${TABLES.USERS.str} SET nome = '$nome', altura = '$altura' WHERE email = '$email';
        """;
    if (db == null) {
      await _init();
    }
    await db!.rawInsert(queryStr);
  }

  Future<void> atualizarSenha(String email, String senha) async {
    String queryStr = """
        UPDATE ${TABLES.USERS.str} SET senha = '$senha' WHERE email = '$email';
        """;
    if (db == null) {
      await _init();
    }
    await db!.rawInsert(queryStr);
  }

  Future<void> atualizarEmail(String email, String novoEmail) async {
    String queryStr = """
        UPDATE ${TABLES.USERS.str} SET email = '$novoEmail' WHERE email = '$email';
        """;
    if (db == null) {
      await _init();
    }
    await db!.rawInsert(queryStr);
  }

  Future<void> remover(String email) async {
    if (db == null) {
      await _init();
    }
    await db!
        .rawInsert('DELETE FROM ${TABLES.USERS.str} WHERE email = "$email";');
  }

  Future<void> _init() async {
    db = await SQLiteDataBase().getDB();
  }
}
