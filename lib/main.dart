import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
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
  String display = '';

  void buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        display = '';
      } else if (value == '=') {
        // Simula o resultado
        display = 'Resultado';
      } else {
        display += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora Responsiva'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.black12,
              padding: EdgeInsets.all(16),
              alignment: Alignment.centerRight,
              child: Text(
                display,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
          ),
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
