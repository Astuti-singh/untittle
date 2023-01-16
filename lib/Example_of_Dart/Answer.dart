import 'package:flutter/material.dart';

class Ques_Answer extends StatelessWidget{
 final button_clicked;
  final  buttontext;
  Ques_Answer(this.button_clicked,this.buttontext);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 50),
      child: RaisedButton(
        color: Colors.blue,
        child: Text(buttontext,
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
        ),onPressed: button_clicked,),
    );
  }
}