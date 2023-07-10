import 'package:expenses/Models/transaction.dart';
import 'package:expenses/components/chart_bar.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSom = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        bool sameDay = recentTransaction[i].date.day == weekday.day;
        bool sameMoth = recentTransaction[i].date.month == weekday.month;
        bool sameYear = recentTransaction[i].date.year == weekday.year;

        if (sameDay && sameMoth && sameYear) {
          totalSom += recentTransaction[i].value;
        }
      }

      return {'day:': DateFormat.E().format(weekday)[0], 'value': totalSom};
    });
  }

double get _weekTotalValue{
  return groupedTransactions.fold(0.0, (sum, tr){
    return sum + double.parse(tr['value'].toString());
  });
}

  @override
  Widget build(BuildContext context) {
    
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: groupedTransactions.map((tr) {
          return ChartBar(
            label: tr['day'].toString(),
            value: tr['value'] as double,
            percentage: (tr['value'] as double) / _weekTotalValue,
            
          );
          
        }).toList(),
      ),
    );
  }
}
