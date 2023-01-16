import 'package:flutter/material.dart';
import '../Models/Transactions.dart';
import 'Transaction_list.dart';
import 'new_Transaction.dart';

class UserTranscation extends StatefulWidget
{
  @override
  State<UserTranscation> createState() {
   return _UserTranscationState();
  }
}

class _UserTranscationState extends  State<UserTranscation>{
  final List<Transaction> _userTransaction=
  [Transaction(id: '1', title: 'Shoping list 1', amount: 69.9, date: DateTime.now()),
    Transaction(id: '2', title: 'Shoping list 2', amount: 23.9,date: DateTime.now()),
    Transaction(id: '3', title: 'Shoping list 3', amount: 45.9, date: DateTime.now())
  ];

  void _addNewTransaction(String txtitle,double txAmount)
  {
    final newTx=Transaction(title: txtitle,amount: txAmount,date: DateTime.now(),id: DateTime.now().toString());
  setState(() {
    _userTransaction.add(newTx);
  });

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        NewTranscation(_addNewTransaction),
     //   TransactionList(_userTransaction),
      ],
    );
  }
}
