import 'package:flutter/material.dart';

import 'package:inicial/constants/colors.dart';
import 'package:inicial/models/pessoa.dart';
import 'package:inicial/models/registro.dart';
import 'package:inicial/repositories/registros.sqlite.dart';
import 'package:inicial/repositories/users.sqlite.dart';
import 'package:inicial/view/cadastro.dart';
import 'package:inicial/view/configuracoes.dart';
import 'package:inicial/view/home.dart';
import 'package:inicial/view/login.dart';
import 'package:inicial/view/registros.dart';

class MainView extends StatefulWidget {
  final String emailLogin;
  const MainView(this.emailLogin, {super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  PageController mainCtrl = PageController(initialPage: 0);
  int pagAtual = 0;

  String? nome;
  double? altura;
  bool temaDark = true;

  List<Registro>? registros;

  String? email;
  String? senha;

  Future<void> _initVariables() async {
    await Future.delayed(const Duration(seconds: 2));
    UserSQLiteRepository text = UserSQLiteRepository();
    Pessoa pessoa = await text.obterPessoa(widget.emailLogin);
    registros = await RegistroSQLiteRepository().obterDados();
    setState(() {
      nome = pessoa.nome;
      altura = pessoa.altura;
      email = pessoa.email;
      senha = pessoa.password;
    });
  }

  Future<void> updateVariables(
      {String? nome,
      double? altura,
      bool? tema,
      List<Registro>? registros,
      String? email}) async {
    if (nome != null) {
      this.nome = nome;
    }
    if (altura != null) {
      this.altura = altura;
    }
    if (tema != null) {
      temaDark = tema;
    }
    if (registros != null) {
      this.registros = registros;
    }
    if (email != null) {
      this.email = email;
    }
  }

  @override
  void initState() {
    _initVariables();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset:
          false, // Evitar do teclado fazer os elementos subirem
      appBar: AppBar(
        title: const Text("Solar Eclipse IMC"),
        backgroundColor: AppBarColors.defaultColor,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        alignment: Alignment.centerLeft,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        title: const Text("Solar Eclipse IMC"),
                        content: const Wrap(
                          children: [
                            Text("Sair do aplicativo!"),
                            Text("Deseja realmente sair do aplicativo ?")
                          ],
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Não')),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Fecha o AlertDialog
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginView()));
                              },
                              child: const Text('Sim'))
                        ],
                      );
                    });
              },
              child: Icon(
                Icons.logout,
                color: InputIconColors.defaultColor,
              ),
            ),
          )
        ],
      ),
      body: Column(children: [
        Expanded(
            child: PageView(
          controller: mainCtrl,
          onPageChanged: (value) {
            setState(() {
              pagAtual = value;
            });
          },
          children: [
            Home(nome ?? "NomeUsuário", altura ?? 0, updateVariables),
            Registros(registros ?? []),
            Configuracoes(nome ?? "NomeUsuário", altura ?? 0,
                email ?? "email@email.com", updateVariables),
            const Cadastro()
          ],
        )),
        BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppBarColors.BottomNavigationBar,
            currentIndex: pagAtual,
            onTap: (value) {
              mainCtrl.jumpToPage(value);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt), label: "Registros"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Configurações")
            ]),
      ]),
    ));
  }
}
