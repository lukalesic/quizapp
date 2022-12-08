//base of questions
import '../models/questions_model.dart';
import '../widgets/answer_option.dart';
import '../models/urls.dart';

   List<Question> questions = [
        
    Question(id: '1', title: 'Question 1', answers: [
      AnswerOption(
          Id: '3', movieTitle: 'title 1', posterURL: URLs[0], correct: true),
      AnswerOption(
          Id: '2', movieTitle: 'title2', posterURL: URLs[0], correct: false),
        AnswerOption(
          Id: '3', movieTitle: 'title3', posterURL: URLs[0], correct: false)
    ], 
    ),


     Question(id: '2', title: 'Question 2', answers: [
      AnswerOption(
          Id: '3', movieTitle: 'title 1', posterURL: URLs[0], correct: true),
      AnswerOption(
          Id: '2', movieTitle: 'title2', posterURL: URLs[0], correct: false),
        AnswerOption(
          Id: '3', movieTitle: 'title3', posterURL: URLs[0], correct: false)
    ], 
    ),
  ];
