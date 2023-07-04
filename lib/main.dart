import 'package:expenses/Model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() => runApp(EspensesApp());

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
  final _transactions = [
    Transaction(
        identidade: 't1', date: DateTime.now(), value: 300.90, title: 'Tênis'),
    Transaction(
        identidade: 't2', date: DateTime.now(), value: 230, title: 'Blusa'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: Column(
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
            Column(
              children: _transactions.map((tr) {
                return Card(
                  child: Row(children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.black,
                        width: 2,
                      )),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'R\$ ${tr.value.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tr.title,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          DateFormat('d MMM y').format(tr.date),
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    )
                  ]),
                );
              }).toList(),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(labelText: 'Titulo'),
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Valor (R\$)'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          
                          TextButton(
                            //style: TextButton.styleFrom(foregroundColor: Colors.green)
                            //ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.purple)), 
                            child: Icon(Icons.add), onPressed: null ),
                        ],
                      )
                      
                    ],
                  )),
            )
          ]),
    );
  }
}
