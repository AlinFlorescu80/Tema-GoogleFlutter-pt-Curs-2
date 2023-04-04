import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Currency Converter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _inputController = TextEditingController();
  double _inputValue = 0.0;
  double _outputValue = 0.0;
  double _conversionRate = 4.92;

  void _convertCurrency() {
    setState(() {
      _inputValue = double.parse(_inputController.text);
      _outputValue = _inputValue * _conversionRate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'pozuri/LeiGrei.jpeg', // path to your image
            ),
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                setState(() {
                  _inputValue = double.tryParse(value) ?? 0.0;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter the amount in EUR',
              ),
            ),
            Text(
              '$_outputValue LEI GREI',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(onPressed: () {
              if (_inputController.text.isEmpty || _inputController.text.startsWith('.') || _inputController.text.endsWith('.')) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please enter a valid number!'),
                  ),
                );
              } else {
                _convertCurrency();
              }
            }
            , child: Text('Convert'))
          ],
        ),
      ),
    );
  }
}
