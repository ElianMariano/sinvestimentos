import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simulador de Investimentos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe4fff7),
      body: Stack(
        children: [
          Container(
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(MediaQuery.of(context).size.width, 100.0)
                  ),
                  color: const Color(0xff03e29f)
              ),
              child: const Center(
                child: Text(
                  'Simular Investimentos',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: Colors.white
                  ),
                ),
              )
          ),
          CalculateInfo()
        ],
      )
    );
  }
}

class CalculateInfo extends StatefulWidget {
  const CalculateInfo({Key? key}) : super(key: key);

  @override
  State<CalculateInfo> createState() => _CalculateInfoState();
}

class _CalculateInfoState extends State<CalculateInfo> {
  final inicialController = TextEditingController();
  final mensalController = TextEditingController();
  final percentController = TextEditingController();
  final periodoController = TextEditingController();

  double resultado = 0;

  @override
  void dispose(){
    inicialController.dispose();
    mensalController.dispose();
    percentController.dispose();
    periodoController.dispose();
    super.dispose();
  }

  void limpar(){
    setState(() {
      resultado = 0;
    });
  }

  void calcular(){
    // Converte os dados
    double inicial = double.parse(inicialController.text);
    double mensal = double.parse(mensalController.text);
    double percent = double.parse(percentController.text);
    int periodo = int.parse(periodoController.text);

    setState(() {
      resultado = double.parse(((inicial + mensal*periodo) * pow((1 + (percent*0.01)), periodo)).toStringAsFixed(2));
    });

    inicialController.clear();
    mensalController.clear();
    percentController.clear();
    periodoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 65,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(6),
                        child: Text(
                          'Investimento Inicial',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(6),
                        child: TextField(
                          controller: inicialController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: null,
                              hintText: '0,00',
                              prefixText: 'R\$ ',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(6),
                        child: Text(
                          'Investimento Mensal',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(6),
                        child: TextField(
                            controller: mensalController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: null,
                                hintText: '0,00',
                                prefixText: 'R\$ ',
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey
                               )
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(6),
                        child: TextField(
                          controller: percentController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: null,
                              hintText: '% ao mês',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(6),
                        child: TextField(
                          controller: periodoController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: null,
                              hintText: 'Período em meses',
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(6),
                        child: Text(
                          'Resultado: R\$ ${resultado}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                      ),
                    ],
                ),
              ),
              width: 300,
              height: 500,
              decoration: BoxDecoration(
                  color: Color(0xffd1fff1),
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: calcular,
                child: Text(
                    'Calcular',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                  ),
                ),
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xff03e29f),
                minimumSize: const Size(300, 20),
              ),
            ),
            TextButton(
              onPressed: limpar,
              child: const Text(
                'Limpar',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xfff5756c),
                minimumSize: const Size(300, 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
