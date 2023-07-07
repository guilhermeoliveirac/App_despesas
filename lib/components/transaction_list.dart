import 'package:expenses/Models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
 
  TransactionList(this.transactions, {Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: 
      transactions.isEmpty? const Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          
          Text(
            "NENHUM GASTO REGISTRADO CADASTRADA",
          ),
        ],
      ):
      ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (cxt, index){
    final tr = transactions[index];
          return Card(
            child: Row(children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Color.fromARGB(205, 161, 185, 185),
                  width: 2,
                )),
                padding: const EdgeInsets.all(10),
                child: Text(
                  'R\$ ${tr.value.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 116, 92, 212),
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
                    style: const TextStyle(color: Color.fromARGB(255, 110, 110, 110)),
                  ),
                ],
              )
            ]),
          );
        },
       
      ),
    );
  }
}
