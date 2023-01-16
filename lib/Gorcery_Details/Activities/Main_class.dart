import 'package:flutter/material.dart';
import 'package:untitled/Gorcery_Details/Widgets/Transaction_list.dart';
import '../Models/Transactions.dart';
import '../Widgets/Chart.dart';
import '../Widgets/new_Transaction.dart';



void main()
{
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          home:MyHomePage(),

        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(titleMedium: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 15,
              color: Colors.white
            )),
          ),
        ),
      )
  );
}

class MyHomePage extends StatefulWidget
{
  @override
  State<MyHomePage> createState() {
    // TODO: implement createState
   return _MyHomePageState();
  }

}

class _MyHomePageState extends State<MyHomePage>{

  final List<Transaction> _userTransaction=
  [];
 // [Transaction(id: '1', title: 'Shoping list 1', amount: 69.9, date: DateTime.now()),
 //    Transaction(id: '2', title: 'Shoping list 2', amount: 23.9, date: DateTime.now()),
 //    Transaction(id: '3', title: 'Shoping list 3', amount: 45.9, date: DateTime.now())
 //  ];

  List<Transaction> get _recentTransactions
  {
  //  return _userTransaction;
    return _userTransaction.where((txdate)
    {
      return txdate.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }



  void _addNewTransaction(String txtitle,double txAmount,DateTime pickeddate)
  {
    final newTx=Transaction(title: txtitle,amount: txAmount,date:
    pickeddate,
        id: DateTime.now().toString());
    setState(() {
      _userTransaction.add(newTx);
    });

  }



  void _startAdd_New_TX(BuildContext ctx,){
    showModalBottomSheet(context: ctx, builder: (_)
    {
      return  NewTranscation(_addNewTransaction);
    });
  }

  void _deleteTransaction(String id)
  {
    setState(() {
      _userTransaction.removeWhere((tx)=>tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Expense Accounting  APP'),
        actions: [
          IconButton(onPressed: ()=>_startAdd_New_TX(context), icon: Icon(Icons.add))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed:()=>_startAdd_New_TX(context),
          child: Icon(Icons.add, color: Colors.white,)
      ),
      body:  SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: double.infinity,
                child: Card(
                  elevation: 6,
                  color: Colors.lightBlue,
                  child:Padding(
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    child:  Center(
                      child:  Text('Chart!',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
            ),
            Chart(_recentTransactions),

            TransactionList(_userTransaction,_deleteTransaction),

          ],

        ),
      ),
    );
  }
}

