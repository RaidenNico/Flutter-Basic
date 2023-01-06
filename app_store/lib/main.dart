import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hola Mundo con Flutter'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Text(
          'Hola Mundo!',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
