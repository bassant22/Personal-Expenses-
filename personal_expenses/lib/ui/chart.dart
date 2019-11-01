import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import '../ui/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      print(weekDay);
      double totalSum = 0.0;
      for (int i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalSum += recentTransaction[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  double get totalSpending {
    return groupedTransaction.fold(0.0, (sum, item) {
      print('the total is ${sum + item['amount']}');
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(recentTransaction);
    print(groupedTransaction);
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(15.0),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransaction.map((item) {
            return Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ChartBar(
                  item['day'],
                  item['amount'],
                  totalSpending == 0.0
                      ? 0.0
                      : (item['amount'] as double) / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
