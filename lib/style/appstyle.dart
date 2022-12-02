import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {

  static Color  backgroundColor = Color(0xFFe2e2fe);
  static Color mainColor = Color(0xFF000633);
  static Color accentColor = Color(0xFF0065FF);

//colors for correct and incorrect answers
  static Color correct = Color(0xFF32AB58);
  static Color incorrect = Color(0xFFAB3232);

  static List<Color> cardsColor = [
  Colors.white,
  Colors.red.shade100,
  Colors.pink.shade100,
  Colors.orange.shade100,
  Colors.yellow.shade100,
  Colors.green.shade100,
  Colors.blue.shade100,
  Colors.blueGrey.shade100,
];


  static TextStyle mainTitle = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.bold
  );

   static TextStyle mainContent = GoogleFonts.nunito(
    fontSize: 16,
    fontWeight: FontWeight.normal
  );

}