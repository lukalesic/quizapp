//base of questions
import 'package:quizapp/models/answer.dart';

import '../models/questions_model.dart';
import '../models/urls.dart';

List<CrewMember> questions = [
  CrewMember(
    id: 1,
    name: '[Actor name]',
    popularity: 23,
    jobTitle: "actor",
    photoUrl: "",
    movies: [
      Movie(
          id: 0,
          title: 'title1',
          imdbRating: '5',
          isAnswer: true,
          posterUrl: URLs[0]),
      Movie(
          id: 1,
          title: 'title2',
          imdbRating: '5',
          isAnswer: false,
          posterUrl: URLs[0]),
      Movie(
          id: 2,
          title: 'title3',
          imdbRating: '5',
          isAnswer: false,
          posterUrl: URLs[0]),
      Movie(
          id: 3,
          title: 'title4',
          imdbRating: '5',
          isAnswer: false,
          posterUrl: URLs[0])
    ],
  ),
  CrewMember(
    id: 1,
    name: '[Director name]',
    popularity: 23,
    jobTitle: "Director",
    photoUrl: "",
    movies: [
      Movie(
          id: 0,
          title: 'title1',
          imdbRating: '5',
          isAnswer: true,
          posterUrl: URLs[0]),
      Movie(
          id: 1,
          title: 'title2',
          imdbRating: '5',
          isAnswer: false,
          posterUrl: URLs[0]),
      Movie(
          id: 2,
          title: 'title3',
          imdbRating: '5',
          isAnswer: false,
          posterUrl: URLs[0]),
      Movie(
          id: 3,
          title: 'title4',
          imdbRating: '5',
          isAnswer: false,
          posterUrl: URLs[0])
    ],
  ),
];
