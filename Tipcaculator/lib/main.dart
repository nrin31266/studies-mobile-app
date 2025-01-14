import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TipCalculator(),
    );
  }
}

class TipCalculator extends StatefulWidget {
  const TipCalculator({Key? key}) : super(key: key);

  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  final TextEditingController _billController = TextEditingController();
  final TextEditingController _tipController = TextEditingController();

  double _tipAmount = 0.0;
  double _totalAmount = 0.0;

  void _calculateTip() {
    double billAmount = double.tryParse(_billController.text) ?? 0.0;
    double tipPercentage = double.tryParse(_tipController.text) ?? 0.0;

    setState(() {
      _tipAmount = billAmount * tipPercentage / 100;
      _totalAmount = billAmount + _tipAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Enter Bill Amount:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _billController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter bill amount',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter Tip Percentage:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _tipController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter tip percentage',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateTip,
              child: const Text('Calculate Tip'),
            ),
            const SizedBox(height: 20),
            Text(
              'Tip Amount: \$${_tipAmount.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              'Total Amount: \$${_totalAmount.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
