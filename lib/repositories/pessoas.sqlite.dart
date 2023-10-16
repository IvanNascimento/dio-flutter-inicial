import 'package:inicial/models/pessoa.dart';
import 'package:inicial/repositories/sqlitedatabase.dart';

class PessoaSQLiteRepository {
  Future<List<Pessoa>> obterDados() async {
    List<Pessoa> tarefas = [];
    var db = await SQLiteDataBase().getDB();
    var result =
        await db.rawQuery('SELECT id, descricao, concluido FROM tarefas');
    for (var element in result) {
      element;
    }
    return tarefas;
  }

  Future<void> salvar(Pessoa pessoa) async {
    var db = await SQLiteDataBase().getDB();
    await db.rawInsert('INSERT INTO tarefas (descricao, concluido) values(?,?)',
        [pessoa.nome, pessoa.altura]);
  }

  Future<void> atualizar(Pessoa tarefaSQLiteModel) async {
    var db = await SQLiteDataBase().getDB();
    await db.rawInsert(
        'UPDATE tarefas SET descricao = ?, concluido = ? WHERE id = ?', [
      tarefaSQLiteModel.nome,
      tarefaSQLiteModel.idade == 18 ? 1 : 0,
      tarefaSQLiteModel.altura
    ]);
  }

  Future<void> remover(int id) async {
    var db = await SQLiteDataBase().getDB();
    await db.rawInsert('DELETE FROM tarefas WHERE id = ?', [id]);
  }
}
