import 'package:expenses/components/transaction_user.dart';
import 'package:flutter/material.dart';

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

class MyHomePage extends StatelessWidget {
  //String title = '';
  //String value = '';

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
              TransactionUser(),
            ]),
      ),
    );
  }
}
