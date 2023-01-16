import 'package:flutter/material.dart';

class Questions extends StatelessWidget
{ final questions;

Questions(this.questions);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

   return Container(
     width: double.infinity,
     margin: EdgeInsets.symmetric(vertical: 20),
     child: Text(questions,
       style: TextStyle(
         fontSize: 20,
         color: Colors.red,
         fontWeight: FontWeight.bold
       ),
       textAlign: TextAlign.center,
     ),
   );

  }

}
//