import 'package:flutter/material.dart';
import 'package:inicial/constants/colors.dart';
import 'package:inicial/repositories/last_email.dart';
import 'package:inicial/repositories/users.sqlite.dart';

class Configuracoes extends StatefulWidget {
  final String nomeUsuario;
  final double altura;
  final String email;
  final Function update;

  const Configuracoes(this.nomeUsuario, this.altura, this.email, this.update,
      {super.key});

  @override
  State<Configuracoes> createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  TextEditingController nomeCtrl = TextEditingController();
  TextEditingController alturaCtrl = TextEditingController();
  TextEditingController nascimentoCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController emailConfCtrl = TextEditingController();
  TextEditingController senhaCtrl = TextEditingController(text: "");
  TextEditingController senhaConfCtrl = TextEditingController(text: "");

  bool showSenha = false;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    nomeCtrl.text = widget.nomeUsuario;
    alturaCtrl.text = widget.altura.toString();
    emailCtrl.text = widget.email;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Center(
                  child: Text(
                "Configurações",
                style: TextStyle(color: TextColors.InvertedColor),
              )),
              backgroundColor: BackGroundColors.defaultColor,
            ),
            backgroundColor: BackGroundColors.defaultColor,
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    decoration: const InputDecoration(hintText: "Nome usuário"),
                    style: TextStyle(color: InputColors.InvertedColor),
                    controller: nomeCtrl,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: "Altura"),
                    style: TextStyle(color: InputColors.InvertedColor),
                    controller: alturaCtrl,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      try {
                        UserSQLiteRepository test = UserSQLiteRepository();
                        test.atualizar(emailCtrl.text,
                            nome: nomeCtrl.text,
                            altura: double.parse(alturaCtrl.text));
                        widget.update(
                            nome: nomeCtrl.text,
                            altura: double.parse(alturaCtrl.text));

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Salvando...")));
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
                    },
                    child: const Text("Salvar")),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: emailCtrl,
                  onChanged: (value) {
                    debugPrint(value);
                  },
                  style: TextStyle(color: InputColors.InvertedColor),
                  decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 141, 79, 151))),
                      hintText: "Email",
                      hintStyle: TextStyle(color: InputColors.InvertedColor),
                      prefixIcon: Icon(
                        Icons.person,
                        color: InputIconColors.InvertedColor,
                      )),
                ),
                TextField(
                  controller: emailConfCtrl,
                  onChanged: (value) {
                    debugPrint(value);
                  },
                  style: TextStyle(color: InputColors.InvertedColor),
                  decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 141, 79, 151))),
                      hintText: "Confirmar Email",
                      hintStyle: TextStyle(color: InputColors.InvertedColor),
                      prefixIcon: Icon(
                        Icons.person,
                        color: InputIconColors.InvertedColor,
                      )),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextButton(
                    onPressed: () async {
                      FocusManager.instance.primaryFocus?.unfocus();

                      UserSQLiteRepository test = UserSQLiteRepository();
                      if (emailCtrl.text == emailConfCtrl.text) {
                        test.atualizarEmail(
                            await LastEmail.getLastEmail(), emailConfCtrl.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Salvando...")));
                      } else {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: const Text("Meu App"),
                                content: const Text("Emails não coincidem!"),
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
                    },
                    child: const Text("Salvar email")),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: senhaCtrl,
                  obscureText: showSenha,
                  onChanged: (value) {
                    debugPrint(value);
                  },
                  style: TextStyle(color: TextColors.InvertedColor),
                  decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 141, 79, 151))),
                      hintText: "Senha",
                      hintStyle: TextStyle(color: InputColors.InvertedColor),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: InputIconColors.InvertedColor,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            showSenha = !showSenha;
                          });
                        },
                        child: Icon(
                          showSenha ? Icons.visibility_off : Icons.visibility,
                          color: InputIconColors.InvertedColor,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: senhaConfCtrl,
                  obscureText: showSenha,
                  onChanged: (value) {
                    debugPrint(value);
                  },
                  style: TextStyle(color: TextColors.InvertedColor),
                  decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 141, 79, 151))),
                      hintText: "Confirmar Senha",
                      hintStyle: TextStyle(color: InputColors.InvertedColor),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: InputIconColors.InvertedColor,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            showSenha = !showSenha;
                          });
                        },
                        child: Icon(
                          showSenha ? Icons.visibility_off : Icons.visibility,
                          color: InputIconColors.InvertedColor,
                        ),
                      )),
                ),
                TextButton(
                    onPressed: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      UserSQLiteRepository test = UserSQLiteRepository();
                      if (senhaCtrl.text == senhaConfCtrl.text) {
                        test.atualizarSenha(emailCtrl.text, senhaCtrl.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Salvando...")));
                      } else {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: const Text("Meu App"),
                                content: const Text("Senhas não coincidem!"),
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
                    },
                    child: const Text("Atualizar Senha")),
              ],
            )));
  }
}
