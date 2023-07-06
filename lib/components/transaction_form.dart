import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  //const TransactionForm({super.key});
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
          elevation: 5,
          child: Column(
            children: [
              TextField(
                controller: titleController,
                //onChanged: (newValue)=> title = (newValue),
                decoration: const InputDecoration(labelText: 'Titulo'),
              ),
              TextField(
                controller: valueController,
                //onChanged: (newValue)=> value = (newValue),
                decoration: const InputDecoration(labelText: 'Valor (R\$)'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      //style: TextButton.styleFrom(foregroundColor: Colors.green)
                      //ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.purple)),
                      child: Icon(Icons.add),
                      onPressed: () {
                        print(titleController.text);
                        print(valueController.text);
                      }),
                ],
              )
            ],
          )),
    );
  }
}
