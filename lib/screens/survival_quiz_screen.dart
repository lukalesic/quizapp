import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quizapp/remote/repository.dart';
import 'package:quizapp/screens/lose_screen.dart';
import '../models/question.dart';
import '../models/highscore.dart';
import 'package:quizapp/style/appstyle.dart';
import 'package:quizapp/widgets/answer_option.dart';
import 'package:quizapp/widgets/question_widget.dart';

class SurvivalQuizScreen extends StatefulWidget {
  final Question question;
  static const String survivalGameMode = 'survival';

  const SurvivalQuizScreen({super.key, required this.question});

  @override
  State<SurvivalQuizScreen> createState() => _SurvivalQuizScreenState(question);
}

class _SurvivalQuizScreenState extends State<SurvivalQuizScreen>
    implements OnAnsweredListener {
  _SurvivalQuizScreenState(this.question);

  Question question;

  bool clickable = true;
  bool highlightAnswer = false;
  List<HighScore> survivalHighScore = List.empty(growable: true);

  int index = 0;
  bool isPressed = false;
  int correctAnswers = 0;
  late int timer = 20;
  late int timerPercentage = timer;
  late Timer _timer;

  void nextQuestion(bool value) {
    setState(() {
      if (value == true) {
        timer += 4;
        timerPercentage = timer;
        correctAnswers++;
      } else if (timer >= 1) {
        timer -= 1;
        index++;
      }
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() async {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();

          HighScore(
                  score: correctAnswers,
                  gameMode: SurvivalQuizScreen.survivalGameMode)
              .save(SurvivalQuizScreen.survivalGameMode);

          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => LoseScreen(
                      correctAnswers: correctAnswers,
                      totalQuestions: 0,
                      gameMode: SurvivalQuizScreen.survivalGameMode,
                      resultScore: correctAnswers,
                      highScores: survivalHighScore,
                    )),
            (Route<dynamic> route) => route.isFirst,
          );
        } else {
          timer = timer - 1;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          color: Colors.white,
        ),
        backgroundColor: AppStyle.accentColor,
      ),
      backgroundColor: AppStyle.backgroundColor,
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.topRight,
                      child: CircularPercentIndicator(
                        radius: 30.0,
                        circularStrokeCap: CircularStrokeCap.round,
                        backgroundColor: Colors.white,
                        progressColor: Colors.blue,
                        percent: timer / timerPercentage,
                        animation: true,
                        animateFromLastPercent: true,
                        center: Text(
                          timer.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Correct answers: $correctAnswers',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              //Timer

              Expanded(
                flex: 1,
                child: QuestionWidget(
                    indexAction: index,
                    question: question.getQuestion(),
                    subject: question.crewMember.name),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                        child: AnswerOption(
                      Id: question.movies[0].id,
                      movieTitle: question.movies[0].title,
                      posterURL: question.movies[0].posterUrl,
                      correct: question.movies[0].isAnswer,
                      listener: this,
                      clickable: clickable,
                      highlightAnswer: highlightAnswer,
                    )),
                    Expanded(
                      child: AnswerOption(
                        Id: question.movies[1].id,
                        movieTitle: question.movies[1].title,
                        posterURL: question.movies[1].posterUrl,
                        correct: question.movies[1].isAnswer,
                        listener: this,
                        clickable: clickable,
                        highlightAnswer: highlightAnswer,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: AnswerOption(
                        Id: question.movies[2].id,
                        movieTitle: question.movies[2].title,
                        posterURL: question.movies[2].posterUrl,
                        correct: question.movies[2].isAnswer,
                        listener: this,
                        clickable: clickable,
                        highlightAnswer: highlightAnswer,
                      ),
                    ),
                    Expanded(
                      child: AnswerOption(
                        Id: question.movies[3].id,
                        movieTitle: question.movies[3].title,
                        posterURL: question.movies[3].posterUrl,
                        correct: question.movies[3].isAnswer,
                        listener: this,
                        clickable: clickable,
                        highlightAnswer: highlightAnswer,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onQuestionAnswered(bool isCorrect) {
    if (!isCorrect) {
      highlightAnswer = true;
    }
    setState(() {
      clickable = false;
    });

    fetchSingleQuestion().then((result) => {
          if (result != null)
            {
              setState(() {
                question = result;
              })
            }
        });

    Future.delayed(const Duration(seconds: 1), () {
      nextQuestion(isCorrect);
      clickable = true;
      highlightAnswer = false;
    });
  }
}
