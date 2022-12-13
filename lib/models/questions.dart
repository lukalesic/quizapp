//base of questions
import 'package:quizapp/models/answer.dart';

import '../models/questions_model.dart';
import '../models/urls.dart';

List<Question> questions = [
  Question(
    id: '1',
    title: 'Question 1',
    answers: [
      Answer(
          id: 0,
          original_title: 'title1',
          imdb_rating: '5',
          is_answer: true,
          photo: URLs[0]),
      Answer(
          id: 1,
          original_title: 'title2',
          imdb_rating: '5',
          is_answer: false,
          photo: URLs[0]),
      Answer(
          id: 2,
          original_title: 'title3',
          imdb_rating: '5',
          is_answer: false,
          photo: URLs[0]),
      Answer(
          id: 3,
          original_title: 'title4',
          imdb_rating: '5',
          is_answer: false,
          photo: URLs[0])
    ],
  ),
  Question(
    id: '2',
    title: 'Question 2',
    answers: [
      Answer(
          id: 0,
          original_title: 'title1',
          imdb_rating: '5',
          is_answer: true,
          photo: URLs[0]),
      Answer(
          id: 1,
          original_title: 'title2',
          imdb_rating: '5',
          is_answer: false,
          photo: URLs[0]),
      Answer(
          id: 2,
          original_title: 'title3',
          imdb_rating: '5',
          is_answer: false,
          photo: URLs[0]),
      Answer(
          id: 3,
          original_title: 'title4',
          imdb_rating: '5',
          is_answer: false,
          photo: URLs[0])
    ],
  ),
];
