import 'package:flutter/material.dart';
import 'package:inicial/constants/colors.dart';
import 'package:inicial/view/configuracoes.dart';
import 'package:inicial/view/home.dart';
import 'package:inicial/view/login.dart';
import 'package:inicial/view/registros.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  PageController mainCtrl = PageController(initialPage: 0);
  int pagAtual = 0;

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
          children: const [Home(), Registros(), Configuracoes()],
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
