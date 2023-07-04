import 'package:flutter/material.dart';

main()=> runApp(EspensesApp());

class EspensesApp extends StatelessWidget {
  const EspensesApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('despesas pessoais'),
        
      ),
      body: Center(child: Text('versão inicial ')),
    );
  }
}