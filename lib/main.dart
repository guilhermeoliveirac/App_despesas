import 'package:expenses/components/chart.dart';
import 'package:flutter/material.dart';

import 'dart:math';
import '/components/transaction_list.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/Models/transaction.dart';

main() => runApp(EspensesApp());

class EspensesApp extends StatelessWidget {
  const EspensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
        theme: ThemeData(
            fontFamily: 'cinzel-semiBold',
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(205, 201, 233, 233),

              //brightness: Brightness.dark,
            )));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      identidade: 't0',
      date: DateTime.now().subtract(Duration(days: 33)),
      value: 300.90,
      title: 'Tênis',
    ),
    Transaction(
      identidade: 't1',
      date: DateTime.now().subtract(Duration(days: 4)),
      value: 230,
      title: 'Blusa',
    ),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      identidade: Random().nextDouble().toString(),
      date: DateTime.now(),
      value: value,
      title: title,
    );

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => {
        setState(() {
          _transactions.add(newTransaction);
        })
      },
    );
    Navigator.of(context).pop();
  }

  _openTransectionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
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
              Chart(_recentTransactions),
              TransactionList(_transactions)
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransectionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
