import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:quizapp/screens/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        name: "QuizApp",
        options: FirebaseOptions(
          apiKey: "AIzaSyC_jexDhLukcJt6d6_Jo-U0l7qey0K6ddM",
          appId: "1:177905671651:web:81330efb3eb5b79bd494d6",
          messagingSenderId: "177905671651",
          projectId: "quizapp-d7281",
        ));
  }

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
