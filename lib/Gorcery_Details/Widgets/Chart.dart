
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled/Gorcery_Details/Widgets/Chart_Bar.dart';

import '../Models/Transactions.dart';

class Chart extends StatelessWidget
{
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 3),
        'amount': totalSum,
      };
    }).reversed.toList();
  }
 double get totalSpending
 {
   return groupedTransactionValues.fold(0.0, (totalsum, element)
   {return totalsum + (element['amount']as double);
   });
 }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
    //  margin: EdgeInsets.symmetric(horizontal: 10),
      child:Padding(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        child: Row(
          children: groupedTransactionValues.map((data)
          {
            return ChartBar(data['day'].toString(),(data['amount'] as double), totalSpending==0?(data['amount'] as double):(data['amount'] as double)/totalSpending);
          }).toList(),
        ) ,
      )
    );
  }

}