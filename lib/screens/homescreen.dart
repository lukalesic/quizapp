import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/screens/quizscreen.dart';
import 'package:quizapp/widgets/quiz_card.dart';
import '../models/questions_model.dart';
import '../style/appstyle.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  int index = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Quiz"),
        foregroundColor: Colors.black,
        centerTitle: true,
        backgroundColor: AppStyle.backgroundColor,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome!", style: GoogleFonts.roboto(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),),
            SizedBox(
              height: 20.0,
            ),
            
          Center(
            child: ElevatedButton(
               onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => QuizScreen())));
               },
            child: Icon(Icons.play_arrow_rounded, color: Colors.white),
            style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
             backgroundColor: Colors.blue, // <-- Button color
              foregroundColor: Colors.red, // <-- Splash color
  ),
),
          )

       
          ],
        ),
      ),
    );
  }
}