import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hola Mundo con Flutter'),
        backgroundColor: Colors.indigo,
      ),
      body: const Center(
        child: Text(
          'Hola Mundo!',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
