import 'package:expenses/Models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {

    final List<Transaction> recentTransaction;

    Chart(this.recentTransaction);

    List<Map<String, Object>> get groupedTransactions{
      return List.generate(7, (index){

        final weekday = DateTime.now().subtract(Duration(days: index),);

        double totalSom = 0.0;
        for(var i = 0; i < recentTransaction.length; i ++){
          bool  sameDay =recentTransaction[i].date.day == weekday.day;
          bool sameMoth =recentTransaction[i].date.month == weekday.month;
          bool sameYear =recentTransaction[i].date.year == weekday.year;

          if(sameDay && sameMoth && sameYear){
            totalSom += recentTransaction[i].value;
          }
        }

        print(totalSom);
        print(DateFormat.E().format(weekday)[0]);

          return {'day:': DateFormat.E().format(weekday)[0],
          'value': totalSom};
      });
    }
  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return const Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [],
      ),
    );
  }
}