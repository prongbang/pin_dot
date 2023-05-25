import 'package:flutter/material.dart';
import 'package:pin_dot/pin_dot.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PIN DOT',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _length = 4;
  final TextEditingController _pinController = TextEditingController();

  @override
  void initState() {
    _pinController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PIN DOT')),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            PinDot(
              size: 16,
              length: _length,
              controller: _pinController,
              activeColor: Colors.blue.shade700,
              borderColor: Colors.yellow.shade700,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    if (_pinController.text.length < _length) {
                      _pinController.text += '1';
                    }
                  },
                  child: Text('ADD'),
                ),
                TextButton(
                  onPressed: () {
                    if (_pinController.text.length > 0) {
                      final x = _pinController.text;
                      _pinController.text = x.substring(0, x.length - 1);
                    }
                  },
                  child: Text('DEL'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
