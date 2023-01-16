import 'package:flutter/material.dart';
import 'package:untitled/Example_of_Dart/Quiz.dart';
import 'package:untitled/Example_of_Dart/Result.dart';


void main()=> runApp(MY_EXAMPLE());


class MY_EXAMPLE extends StatefulWidget {
  @override
  State<MY_EXAMPLE> createState() {
   return Example_state();
  }
}

class Example_state extends State<MY_EXAMPLE>{
 var _ques_index=0;
 var _total_score=0;
 final _questions=
 const [
   { 'questiontext':'What is your favourite food?',
     'answers':[{'text':'Chinese','score':9},{'text':'Italian','score':30},
 {'text':'Continental','score':8},{'text':'Indian','score':8}]
   },
   {'questiontext':'What is your favourite Color?',
     'answers':[
       {'text':'Red','score':8},
       {'text':'Black','score':10},
       {'text':'Blue','score':9},
       {'text':'Yellow','score':4}
     ],
   },
   {'questiontext':'What is your favourite animal?',
     'answers':[
       {'text':'Dog','score':8},
       {'text':'Lion','score':4},
       {'text':'Tiger','score':2},
       {'text':'Panda','score':2}
     ],
   },
   {'questiontext':'What is your favourite flower?',
     'answers':[
       {'text':'Rose','score':8},
       {'text':'Lotus','score':8},
       {'text':'Lily','score':8},
       {'text':'Dahlia','score':8}
     ],
   }
 ];
 void _reset_quiz(){
   setState(() {
     _ques_index=0;
     _total_score=0;
     if(_ques_index<_questions.length)
     {
       graeter_len=true;
     }
     else
     {
       graeter_len=false;
     }

   });
 }
var graeter_len=true; // if length is small;
void _answer_Question(int score)
{
  _total_score+=score;
  setState(() {
    _ques_index=_ques_index+1;
  });
  if(_ques_index<_questions.length)
  {
    graeter_len=true;
  }
  else
  {
    graeter_len=false;
  }
  print(_ques_index);
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.yellowAccent,
        appBar: AppBar(title: Text('Example of Dart'),),
        body:graeter_len?
        Quiz(
          answer_Question: _answer_Question,
          questions: _questions,
          ques_index: _ques_index,) : result(_total_score,_reset_quiz),
      ),

    );

  }
}