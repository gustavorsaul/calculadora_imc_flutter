import 'package:calculadora_imc/alert_message.dart';
import 'package:calculadora_imc/botao_calcular_imc.dart';
import 'package:calculadora_imc/info_imc.dart';
import 'package:flutter/material.dart';

class MinhaCalculadoraIMC extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MinhaCalculadoraIMCState();
}

class _MinhaCalculadoraIMCState extends State<MinhaCalculadoraIMC> {
  late TextEditingController pesoController;
  late TextEditingController alturaController;

  double valorPeso = 50;
  double valorAltura = 0.5;

  late double imc = 0.0;
  late String classificacao;
  late Color corResultado;

  @override
  void initState() {
    pesoController = TextEditingController(text: valorPeso.toString());
    alturaController = TextEditingController(text: valorAltura.toString());
    super.initState();
  }

  @override
  void dispose() {
    pesoController.dispose();
    alturaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ignore: unnecessary_null_comparison
            imc == 0.0
                ? AlertMessage()
                : InfoIMC(
                  corResultado: corResultado,
                  imc: imc,
                  classificacao: classificacao,
                ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text("Seu peso"),
                      SizedBox(height: 6),
                      Container(
                        width: 95,
                        child: TextField(
                          enabled: false,
                          controller: pesoController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            suffixText: "kg",
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                          trackHeight: 1.5,
                          activeTickMarkColor: Colors.purple,
                        ),
                        child: Slider(
                          inactiveColor: const Color.fromARGB(
                            255,
                            201,
                            201,
                            201,
                          ),
                          activeColor: Colors.purple,
                          value: valorPeso,
                          onChanged: (peso) {
                            setState(() {
                              valorPeso = peso;
                              pesoController.text = valorPeso.toStringAsFixed(
                                2,
                              );
                            });
                          },
                          min: 50,
                          max: 200,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    children: [
                      Text("Sua altura"),
                      SizedBox(height: 6),
                      Container(
                        width: 85,
                        child: TextField(
                          enabled: false,
                          controller: alturaController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            suffixText: "m",
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                          trackHeight: 1.5,
                          activeTickMarkColor: Colors.purple,
                        ),
                        child: Slider(
                          inactiveColor: const Color.fromARGB(
                            255,
                            201,
                            201,
                            201,
                          ),
                          activeColor: Colors.purple,
                          value: valorAltura,
                          onChanged: (altura) {
                            setState(() {
                              valorAltura = altura;
                              alturaController.text = valorAltura
                                  .toStringAsFixed(2);
                            });
                          },
                          min: 0.5,
                          max: 2.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            BotaoCalcularImc(
              onPressed: () {
                double peso = double.parse(pesoController.text);
                double altura = double.parse(alturaController.text);
                setState(() {
                  imc = peso / (altura * altura);
                  classificacao = getClassificacaoImc(imc);
                  corResultado = getCorImc(imc);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  String getClassificacaoImc(double imc) {
    if (imc <= 18.5) {
      return "Abaixo do peso";
    } else if (imc > 18.5 && imc <= 24.9) {
      return "Peso normal";
    } else if (imc > 25.0 && imc < 29.9) {
      return "Sobrepeso";
    } else if (imc > 30.0 && imc < 34.9) {
      return "Obesidade grau I";
    } else if (imc > 35.0 && imc < 39.9) {
      return "Obesidade grau II";
    } else if (imc > 40.0) {
      return "Obesidade grau III";
    }
    return "Valor inválido";
  }

  Color getCorImc(double imc) {
    if (imc <= 18.5) {
      return Colors.blue;
    } else if (imc > 18.5 && imc <= 24.9) {
      return Colors.green;
    } else if (imc > 25.0 && imc < 29.9) {
      return Color(0xFFF4BE8E);
    } else if (imc > 30.0 && imc < 34.9) {
      return Color(0xFFEE9809);
    } else if (imc > 35.0 && imc < 39.9) {
      return Color(0xFFE44F38);
    } else if (imc > 40.0) {
      return Colors.red;
    }
    return Colors.grey;
  }
}
