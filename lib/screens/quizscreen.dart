import 'package:flutter/material.dart';
import 'package:quizapp/style/appstyle.dart';
import 'package:quizapp/models/questions_model.dart';
import 'package:quizapp/widgets/next_question_button.dart';
import 'package:quizapp/widgets/question_widget.dart';
import 'package:quizapp/widgets/next_question_button.dart';
import 'package:quizapp/widgets/option_card.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  List<Question> _questions = [
    Question(id: '1', title: 'Question 1', answers: {'a':false, 'b':false, 'c': true, 'd':false}),
    Question(id: '2', title: 'Question 1', answers: {'a':false, 'b':false, 'c': true, 'd':false}),
    Question(id: '3', title: 'Question 1', answers: {'a':false, 'b':false, 'c': true, 'd':false})

  ];

//index for looping through questions
int index = 0;

void nextQuestion(){
  setState(() {
    if(index== _questions.length - 1){ 
      return;
      }
      else {
    index++; //
      }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      appBar: AppBar(
          elevation: 0.0,
        leading: BackButton(color: Colors.black,),
        backgroundColor: AppStyle.backgroundColor,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            QuestionWidget(
              indexAction: index,
               question: _questions[index].title,
                totalQuestions: _questions.length
                ),
           for(int i = 0; i<_questions[index].answers.length; i++)
           OptionCard(option: _questions[index].answers.keys.toList()[i]),
          ],
        )
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: NextButton(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
    
  }
}