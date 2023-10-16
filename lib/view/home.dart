import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inicial/constants/colors.dart';
import 'package:inicial/services/images.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pesoCtrl = TextEditingController(text: "");
  TextEditingController dataCtrl = TextEditingController(text: "");
  DateTime initDate = DateTime.now();

  _init() {
    DateTime hoje = DateTime.now();
    dataCtrl.text = "${hoje.day}/${hoje.month}/${hoje.year}";
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BackGroundColors.MainView,
      child: ListView(
        children: [
          Column(
            children: [
              Image.asset(
                AppImages.profile,
              ),
              const SizedBox(height: 25),
              Text(
                "Bem Vindo, [nome]!",
                style: TextStyle(color: TextColors.InvertedColor),
              ),
              const SizedBox(height: 75),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Peso: ",
                    style: TextStyle(color: TextColors.InvertedColor),
                  ),
                  Container(
                      width: 150,
                      alignment: Alignment.center,
                      child: TextField(
                        controller: pesoCtrl,
                        keyboardType: TextInputType.number,
                        onTapOutside: (PointerDownEvent _) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        autofocus: false,
                        style: TextStyle(color: TextColors.InvertedColor),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText:
                                "${(60 + (Random().nextDouble() * 30)).toStringAsFixed(0)}.00 kg",
                            hintStyle:
                                TextStyle(color: InputColors.InvertedHintColor),
                            suffixText: "kg",
                            suffixIcon: Icon(
                              Icons.scale,
                              color: InputIconColors.InvertedColor,
                            ),
                            suffixStyle:
                                TextStyle(color: TextColors.InvertedColor)),
                      )),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Data: ",
                    style: TextStyle(color: TextColors.InvertedColor),
                  ),
                  Container(
                    width: 150,
                    alignment: Alignment.center,
                    child: TextField(
                      onTap: () async {
                        final DateTime? escolhido = await showDatePicker(
                            context: context,
                            initialDate: initDate,
                            firstDate: DateTime(2020),
                            lastDate: DateTime(5000));

                        if (escolhido != null) {
                          setState(() {
                            initDate = escolhido;
                            dataCtrl.text =
                                "${escolhido.day}/${escolhido.month}/${escolhido.year}";
                          });
                        }
                      },
                      textAlign: TextAlign.center,
                      controller: dataCtrl,
                      readOnly: true,
                      decoration: InputDecoration(
                          hintStyle:
                              TextStyle(color: InputColors.InvertedHintColor),
                          suffixIcon: Icon(
                            Icons.calendar_month_outlined,
                            color: InputIconColors.InvertedColor,
                          )),
                      style: TextStyle(color: InputColors.InvertedColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: 200,
                height: 60,
                child: TextButton(
                    onPressed: () {
                      if (pesoCtrl.text != "" && dataCtrl.text != "") {
                        try {
                          double.parse(pesoCtrl.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Salvando...")));
                        } on FormatException catch (_) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Peso inválido, insira o peso no seguinte formato: 60.00")));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Dados inválidos, confirme os dados")));
                      }
                    },
                    child: const Text("Salvar")),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
