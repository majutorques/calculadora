import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Web',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CalculadoraPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculadoraPage extends StatefulWidget {
  @override
  _CalculadoraPageState createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  String input = '';
  String result = '';

  void buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        input = '';
        result = '';
      } else if (value == '=') {
        try {
          result = _calculateResult(input);
        } catch (e) {
          result = 'Erro';
        }
      } else {
        input += value;
      }
    });
  }

  String _calculateResult(String expression) {
    // Simulação de cálculo para o exemplo
    // Adicione um pacote para cálculos reais, como o `math_expressions`
    return "Resultado";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora')),
      body: Column(
        children: [
          // Display da Calculadora
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.black12,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(input, style: TextStyle(fontSize: 24)),
                  Text(result, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          // Botões
          Expanded(
            flex: 2,
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              padding: EdgeInsets.all(8),
              children: [
                ...['7', '8', '9', '/'],
                ...['4', '5', '6', '*'],
                ...['1', '2', '3', '-'],
                ...['C', '0', '=', '+'],
              ].map((btnText) {
                return ElevatedButton(
                  onPressed: () => buttonPressed(btnText),
                  child: Text(
                    btnText,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

