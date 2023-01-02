import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class HighScore {
  final String gameMode;
  final int score;

  HighScore(
      {required this.gameMode, required this.score});

  Map<String, dynamic> toMap() {
    return {
      'gameMode': gameMode,
      'score': score,
    };
  }

  factory HighScore.fromMap(Map<String, dynamic> map) {
    return HighScore(
        gameMode: map['gameMode'] as String,
        score: map['score'] as int);
  }


  save(String gameMode) async {
    final prefs = await SharedPreferences.getInstance();

    String? initialHighScores = prefs.getString(gameMode);
    List currentHighScores = [];
    Map map = toMap();

    if (initialHighScores != null) {
      currentHighScores = jsonDecode(initialHighScores);
    }

    currentHighScores.add(map);
    currentHighScores.sort((a, b) => (b["score"]).compareTo(a["score"]));
    // return only one highest score, change number to expand to multiple scores
    currentHighScores = currentHighScores.take(1).toList();
    await prefs.setString(gameMode, jsonEncode(currentHighScores));
  }
}