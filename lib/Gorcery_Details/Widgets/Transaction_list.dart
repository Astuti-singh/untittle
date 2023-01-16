import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/Transactions.dart';

class TransactionList extends StatelessWidget{
  final List<Transaction> trans_List;
  final Function delete_TX;
  TransactionList(this.trans_List,this.delete_TX);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      height:MediaQuery.of(context).size.height * 0.3,
      padding: EdgeInsets.only(bottom: 100),
      child: trans_List.isEmpty?
          Center(child: Text('No Transaction list is present',))
          : ListView.builder(
        itemCount: trans_List.length,
        itemBuilder: (ctx,index)  {
          return Card(

            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            elevation: 5,
            color: Colors.white,
            child: Container(
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('\$${trans_List[index].amount.toStringAsFixed(2)}',
                        style: TextStyle(color: Theme.of(context).accentColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                title: Text(trans_List[index].title,
                  style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ), ),
                subtitle:Text(DateFormat.yMMMd().format(trans_List[index].date),
                  style: TextStyle(color: Colors.indigo,
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                  ),
                ) ,
                trailing: IconButton(icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed:()
                {
                  delete_TX(trans_List[index].id);
                }
                ),
              ),
            ),
        );},
      )
    );
  }

}





/*



class TransactionList extends StatelessWidget{
  final List<Transaction> trans_List;
  TransactionList(this.trans_List);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      height:500,
      padding: EdgeInsets.only(bottom: 100),
      child: trans_List.isEmpty?
          Center(
            child: Text('No Transaction list is present',
          )
          )
          : ListView.builder(
        itemCount: trans_List.length,
        itemBuilder: (ctx,index)
        { return Card(
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
                      border: Border.all( color:Theme.of(context).primaryColorDark,width: 1)
                  ),
                  child: Text('\$${trans_List[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(color: Theme.of(context).primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(trans_List[index].title,
                      style: TextStyle(color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      ), ),
                    Text(DateFormat.yMMMd().format(trans_List[index].date),
                      style: TextStyle(color: Colors.indigo,
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                )
              ],
            )
        );},
      )
    );
  }

}



*/