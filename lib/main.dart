import 'package:flutter/material.dart';

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
  void calcular(){
    print("Hello");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 140,
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Investimento Inicial',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    ),
                    Text(
                      'Investimento Mensal',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    Text(
                      '% ao ano',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    Text(
                      'meses',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    Text(
                      'Resultado: R\$ 0,00',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
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
        ],
      ),
    );
  }
}