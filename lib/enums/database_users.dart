enum USERS {
  id('id', 'INTEGER PRIMARY KEY AUTOINCREMENT'),
  email('email', 'TEXT UNIQUE NOT NULL'),
  senha('senha', 'TEXT NOT NULL'),
  nome('nome', 'TEXT NOT NULL'),
  altura('altura', 'REAL NOT NULL'),
  peso('peso', 'REAL NOT NULL'),
  nascimento('nascimento', 'TEXT NOT NULL');

  const USERS(this.col, this.attributes);

  final String col;
  final String attributes;

  @override
  String toString() {
    return "$col $attributes";
  }

  static String get colunas =>
      "${id.col}, ${email.col}, ${senha.col}, ${nome.col}, ${peso.col}, ${altura.col}, ${nascimento.col}";
}
