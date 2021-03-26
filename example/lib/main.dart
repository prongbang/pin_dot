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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PIN DOT')),
      body: Center(
        child: PinDot(
          size: 13,
          length: 4,
          text: '12',
          activeColor: Colors.blue[700],
          borderColor: Colors.yellow[700],
        ),
      ),
    );
  }
}
