// ignore_for_file: non_constant_identifier_names

enum REGISTROS {
  id('id', 'INTEGER PRIMARY KEY AUTOINCREMENT'),
  peso('peso', 'REAL NOT NULL'),
  altura('altura', 'REAL NOT NULL'),
  data("data", "TEXT NOT NULL"),
  PessoaId("PessoaId", "INTEGER NOT NULL");

  const REGISTROS(this.col, this.attributes);

  final String col;
  final String attributes;

  @override
  String toString() {
    return "$col $attributes";
  }

  static String get colunas =>
      "${id.col}, ${peso.col}, ${altura.col}, ${data.col}, ${PessoaId.col}";
}
