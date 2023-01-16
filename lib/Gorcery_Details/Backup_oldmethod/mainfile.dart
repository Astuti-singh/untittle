import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:untitled/Gorcery_Details/Widgets/Transaction_list.dart';
import 'package:untitled/Gorcery_Details/Widgets/User_transaction.dart';

import '../Widgets/new_Transaction.dart';



void main()
{
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Grocery(),
      )
  );
}



class Grocery extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Grocery_body(),
      appBar: AppBar(
        title: Text('VIDEO APP'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed:(){},
          child: Icon(Icons.add, color: Colors.white,)
      ),
    );




  }


}




Widget Grocery_body()
{
  return  SingleChildScrollView(
    child: Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            width: double.infinity,
            child: Card(
              elevation: 5,
              color: Colors.lightBlue,
              child:Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child:  Center(
                  child:  Text('Chart!',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
        ),
        UserTranscation(),

      ],

    ),
  );
}