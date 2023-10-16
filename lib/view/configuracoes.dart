import 'package:flutter/material.dart';

class Configuracoes extends StatefulWidget {
  const Configuracoes({super.key});

  @override
  State<Configuracoes> createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  TextEditingController nomeCtrl = TextEditingController();
  TextEditingController alturaCtrl = TextEditingController();
  TextEditingController nascimentoCtrl = TextEditingController();

  String? nomeUsuario;
  double? altura;
  bool receberNotificacoes = false;
  bool temaEscuro = false;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: const Text("Configurações")),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    decoration: const InputDecoration(hintText: "Nome usuário"),
                    controller: nomeCtrl,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: "Altura"),
                    controller: alturaCtrl,
                  ),
                ),
                SwitchListTile(
                  title: const Text("Receber notificações"),
                  onChanged: (bool value) {
                    setState(() {
                      receberNotificacoes = value;
                    });
                  },
                  value: receberNotificacoes,
                ),
                SwitchListTile(
                    title: const Text("Tema escuro"),
                    value: temaEscuro,
                    onChanged: (bool value) {
                      setState(() {
                        temaEscuro = value;
                      });
                    }),
                TextButton(
                    onPressed: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      try {
                        // await storage.setConfiguracoesAltura(
                        //     double.parse(alturaController.text));
                      } catch (e) {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: const Text("Meu App"),
                                content: const Text(
                                    "Favor informar uma altura válida!"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Ok"))
                                ],
                              );
                            });
                        return;
                      }
                      // await storage.setConfiguracoesNomeUsuario(
                      //     nomeUsuarioController.text);
                      // await storage.setConfiguracoesReceberNotificacao(
                      //     receberNotificacoes);
                      // await storage.setConfiguracoesTemaEscuro(temaEscuro);
                      // Navigator.pop(context);
                    },
                    child: const Text("Salvar"))
              ],
            )));
  }
}
