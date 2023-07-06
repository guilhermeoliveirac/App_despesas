import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/material.dart';

import 'dart:math';
import '/components/transaction_list.dart';
import '/components/transaction_form.dart';
import 'package:expenses/Models/transaction.dart';


main() => runApp(EspensesApp());

class EspensesApp extends StatelessWidget {
  const EspensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
final _transactions = [
    Transaction(
        identidade: 't1',
         date: DateTime.now(), 
         value: 300.90, 
         title: 'Tênis',),
    Transaction(
        identidade: 't2',
         date: DateTime.now(),
          value: 230, 
          title: 'Blusa',),
  ];
  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      identidade: Random().nextDouble().toString(),
      date: DateTime.now(),
      value: value,
      title: title,
    );
    setState(() {
      _transactions.add(newTransaction);
    });
  }
  _openTransectionFormModal(BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (_){
        return TransactionForm(_addTransaction);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: SingleChildScrollView(
        // AQUI CONSEGUIMOS PASSAR ALÉM DA TELA, REMOVENDO O LIMITECon
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                child: const Card(
                  color: Colors.blue,
                  child: Text('Gráfico'),
                  elevation: 5,
                ),
              ),
              TransactionList(_transactions)
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=> _openTransectionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
