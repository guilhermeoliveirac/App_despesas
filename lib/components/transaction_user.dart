import 'dart:math';

import 'package:flutter/material.dart';
import '/components/transaction_list.dart';
import '/components/transaction_form.dart';
import '../Model/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
        identidade: 't1', date: DateTime.now(), value: 300.90, title: 'Tênis'),
    Transaction(
        identidade: 't2', date: DateTime.now(), value: 230, title: 'Blusa'),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(_addTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
