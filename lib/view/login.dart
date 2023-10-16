import 'package:flutter/material.dart';
import 'package:inicial/constants/colors.dart';
import 'package:inicial/services/images.dart';
import 'package:inicial/view/main.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var emailCtrl = TextEditingController(text: "email@email.com");
  var senhaCtrl = TextEditingController(text: "123");
  bool showSenha = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BackGroundColors.LoginView,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      flex: 8,
                      child: Image.asset(
                        AppImages.logo,
                        height: 150,
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Ja tem cadastro?",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: TextColors.InvertedColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Faça seu login e acompanhe sua saúde",
                  style:
                      TextStyle(fontSize: 14, color: TextColors.InvertedColor),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: emailCtrl,
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    style: TextStyle(color: InputColors.InvertedColor),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: -5),
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
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: senhaCtrl,
                    obscureText: showSenha,
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    style: TextStyle(color: TextColors.InvertedColor),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: -5),
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
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {
                          if (emailCtrl.text.trim() == "email@email.com" &&
                              senhaCtrl.text.trim() == "123") {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainView()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Erro ao efetuar o login")));
                          }
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor: MaterialStateProperty.all(
                                ButtonColors.loginColor)),
                        child: Text(
                          "ENTRAR",
                          style: TextStyle(
                              color: TextColors.InvertedColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        )),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.center,
                  child: SizedBox(
                    child: TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Não implementado")));
                      },
                      child: const Text(
                        "Esqueci minha senha",
                        style: TextStyle(
                            color: Colors.yellow, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.center,
                  child: SizedBox(
                    child: TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Não implementado")));
                      },
                      child: const Text(
                        "Criar conta",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
