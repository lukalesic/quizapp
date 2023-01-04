import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quizapp/screens/lose_screen.dart';
import '../models/question.dart';
import '../models/highscore.dart';
import 'win_screen.dart';
import 'package:quizapp/style/appstyle.dart';
import 'package:quizapp/widgets/answer_option.dart';
import 'package:quizapp/widgets/question_widget.dart';

class SurvivalQuizScreen extends StatefulWidget {
  final List<Question> questions;
  static const String survivalGameMode = 'survival';

  const SurvivalQuizScreen({super.key, required this.questions});

  @override
  State<SurvivalQuizScreen> createState() => _SurvivalQuizScreenState();
}

class _SurvivalQuizScreenState extends State<SurvivalQuizScreen>
    implements OnAnsweredListener {
  bool clickable = true;
  bool highlightAnswer = false;
  List<HighScore> survivalHighScore = List.empty(growable: true);

  int index = 0;
  bool isPressed = false;
  int correctAnswers = 0;
  static const int secondsPerQuestion = 10;
  late int timer = secondsPerQuestion;
  late Timer _timer;

  void nextQuestion(bool value) {
    setState(() {
      timer = secondsPerQuestion;
      if (value == true) {
        correctAnswers++;
      }
      if (index == widget.questions.length - 1) {
        //end of questions
        _timer.cancel();
        HighScore(
                score: correctAnswers,
                gameMode: SurvivalQuizScreen.survivalGameMode)
            .save(SurvivalQuizScreen.survivalGameMode);

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => WinScreen(
                    correctAnswers: correctAnswers,
                    totalQuestions: widget.questions.length,
                    gameMode: SurvivalQuizScreen.survivalGameMode,
                    resultScore: correctAnswers,
                    highScores: survivalHighScore,
                  )),
          (Route<dynamic> route) => route.isFirst,
        );
        return;
      } else {
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
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => LoseScreen(
                      correctAnswers: correctAnswers,
                      totalQuestions: widget.questions.length,
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
                        percent: timer / secondsPerQuestion,
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
                      'Correct answers: $correctAnswers/${widget.questions.length}',
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
                    question: widget.questions[index].getQuestion(),
                    subject: widget.questions[index].crewMember.name),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                        child: AnswerOption(
                      Id: widget.questions[index].movies[0].id,
                      movieTitle: widget.questions[index].movies[0].title,
                      posterURL: widget.questions[index].movies[0].posterUrl,
                      correct: widget.questions[index].movies[0].isAnswer,
                      listener: this,
                      clickable: clickable,
                      highlightAnswer: highlightAnswer,
                    )),
                    Expanded(
                      child: AnswerOption(
                        Id: widget.questions[index].movies[1].id,
                        movieTitle: widget.questions[index].movies[1].title,
                        posterURL: widget.questions[index].movies[1].posterUrl,
                        correct: widget.questions[index].movies[1].isAnswer,
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
                        Id: widget.questions[index].movies[2].id,
                        movieTitle: widget.questions[index].movies[2].title,
                        posterURL: widget.questions[index].movies[2].posterUrl,
                        correct: widget.questions[index].movies[2].isAnswer,
                        listener: this,
                        clickable: clickable,
                        highlightAnswer: highlightAnswer,
                      ),
                    ),
                    Expanded(
                      child: AnswerOption(
                        Id: widget.questions[index].movies[3].id,
                        movieTitle: widget.questions[index].movies[3].title,
                        posterURL: widget.questions[index].movies[3].posterUrl,
                        correct: widget.questions[index].movies[3].isAnswer,
                        listener: this,
                        clickable: clickable,
                        highlightAnswer: highlightAnswer,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 2.0),
                child: SizedBox(
                  width: 200,
                  child: LinearPercentIndicator(
                    animation: true,
                    animationDuration: 350,
                    barRadius: const Radius.circular(2),
                    animateFromLastPercent: true,
                    percent: index / widget.questions.length,
                    progressColor: Colors.blue,
                    backgroundColor: Colors.white,
                  ),
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
    Future.delayed(const Duration(seconds: 1), () {
      nextQuestion(isCorrect);
      clickable = true;
      highlightAnswer = false;
    });
  }
}
