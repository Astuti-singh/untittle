
import 'package:flutter/material.dart';

class result extends StatelessWidget{
  final resultscore;
  final reset_quiz;
  result(this.resultscore,this.reset_quiz);


  String get resultpharse{
    String resulttext='';
    if (resultscore<=35)
      {
        resulttext='You did it!';
      }
    else if(resultscore>=35)
    {
      resulttext='You Completed it!';
    }
    else{
      resulttext='Excellent!';
    }

    return resulttext;

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return  Column(
     children: [
       Center(child:
       Container(
       width: double.infinity,
       margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: Text(resultpharse+' \nNo more Questions left.  '+'\n Your total score is :- \t $resultscore',
        style: TextStyle(
        fontSize: 20,
        color: Colors.red,
        fontWeight: FontWeight.bold
        ),
        textAlign: TextAlign.center,
        ),
        ),
       ),
       FlatButton(
         onPressed: reset_quiz,
         child: Text('Restart Your Quiz!',
         style: TextStyle(
           fontWeight: FontWeight.bold,
           fontSize: 20,
           color: Colors.deepPurple
         ),),
       ),
     ],
   );
  }
}
