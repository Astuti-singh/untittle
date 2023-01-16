import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/Transactions.dart';

class TransactionList extends StatelessWidget{
  final List<Transaction> trans_List;
  TransactionList(this.trans_List);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      height: 300,
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: trans_List.map((tx)
        {
          return Card(
              child: Row(

                children: [
                  // Text('  '+tx.id+').',
                  //   style: TextStyle(color: Colors.red,
                  //       fontSize: 15,
                  //       fontWeight: FontWeight.bold),),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all( color: Colors.purple,width: 1)
                    ),
                    child: Text('\$${tx.amount}',
                      style: TextStyle(color: Colors.purple,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tx.title,
                        style: TextStyle(color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                        ), ),
                      Text(DateFormat.yMMMd().format(tx.date),
                        style: TextStyle(color: Colors.indigo,
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  )
                ],
              )
          );
        }
        )
            .toList(),
      ),

    );
  }

}
