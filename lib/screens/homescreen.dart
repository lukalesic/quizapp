import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  //List<Quiz> _quizzes = [];

  List<Question> _questions = [
    Question(id: '1', title: 'Question 1', answers: {'a':false, 'b': false, 'c': true}),
    Question(id: '2', title: 'Question 2', answers: {'a':false, 'b': false, 'c': true})

  ];

//for looping through questions
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Available quizzes", style: GoogleFonts.roboto(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("quizzes").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
            
                  if(snapshot.hasData){
                    return GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    children: snapshot.data!.docs.map((quiz) => quizCard((){}, quiz)).toList(),
                    );
                  }
                                return Text("No quizzes available.", style: GoogleFonts.nunito(color: Colors.black),);
            
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}