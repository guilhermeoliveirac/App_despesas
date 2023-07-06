import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit, {Key? key}):super(key: key);

  //const TransactionForm({super.key});
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  _submitForm(){

  final title = titleController.text;
  final value = double.tryParse(valueController.text)?? 0.0;

  if(title.isEmpty || value<=0){
    return;
  }
  onSubmit(title,value);
                      
  }

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
                onSubmitted: (_) => _submitForm(),
                decoration: const InputDecoration(
                  labelText: 'Titulo',),
              ),
              TextField(
                controller: valueController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
                decoration: const InputDecoration(labelText: 'Valor (R\$)'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      //style: TextButton.styleFrom(foregroundColor: Colors.green)
                      //ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.purple)),
                      child: Icon(Icons.add),
                      onPressed: (_submitForm())),
                ],
              )
            ],
          )),
    );
  }
}
