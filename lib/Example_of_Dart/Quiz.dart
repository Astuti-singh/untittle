import 'package:flutter/material.dart';
import 'package:untitled/Example_of_Dart/Answer.dart';
import 'package:untitled/Example_of_Dart/Questions.dart';

class Quiz extends StatelessWidget
{
  final int ques_index;
  final Function answer_Question;
  final List<Map<String, Object>> questions;

  Quiz({required this.answer_Question,
    required this.questions,
    required this.ques_index});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column (
      children: [
        Questions(questions[ques_index]['questiontext']),
        ...(questions[ques_index]['answers'] as List<Map<String, Object>>).map((answer_obj)
        {
          return Ques_Answer(
                  ()=>answer_Question(answer_obj['score']
                  ),
              answer_obj['text']);
        }).toList(),
      ],
    );
  }
}