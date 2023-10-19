import 'package:flutter/material.dart';
import 'package:inicial/enums/database_registros.dart';
import 'package:inicial/enums/database_tables.dart';
import 'package:inicial/enums/database_users.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

Map<int, String> scripts = {
  0: '''
    CREATE TABLE ${TABLES.USERS.str} ( 
      ${USERS.id.toString()}, 
      ${USERS.email.toString()}, 
      ${USERS.senha.toString()}, 
      ${USERS.nome.toString()}, 
      ${USERS.altura.toString()}, 
      ${USERS.peso.toString()}, 
      ${USERS.nascimento.toString()}
    );
  ''',
  1: ''' 
    CREATE TABLE IF NOT EXISTS ${TABLES.REGISTROS.str} ( 
      ${REGISTROS.id.toString()}, 
      ${REGISTROS.peso.toString()}, 
      ${REGISTROS.altura.toString()}, 
      ${REGISTROS.data.toString()},
      ${REGISTROS.PessoaId.toString()}
    );
  '''
};

class SQLiteDataBase {
  static Database? db;

  Future<Database> getDB() async {
    if (db == null) {
      return await initDB();
    } else {
      return db!;
    }
  }

  Future<Database> initDB() async {
    db = await openDatabase(
        path.join(await getDatabasesPath(), 'sqlite.database.db'),
        version: scripts.length, onCreate: (Database db, int version) async {
      for (var i = 0; i < scripts.length; i++) {
        await db.execute(scripts[i]!);
        debugPrint(scripts[i]!);
      }
    }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
      for (var i = oldVersion; i < scripts.length; i++) {
        await db.execute(scripts[i]!);
        debugPrint(scripts[i]!);
      }
    });
    return db!;
  }
}
