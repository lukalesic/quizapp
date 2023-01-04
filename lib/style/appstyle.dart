import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color backgroundColor = Color(0xFF1A1C1E);
  static Color accentColor = Color(0xFF039CFD);
  static Color textColor = Color(0xFFCACACA);
  static Color borderColor = Color(0x70CACACA);
  static Color cardColor = Color(0xFF292b2e);

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
      fontSize: 18, fontWeight: FontWeight.bold, color: textColor);

  static TextStyle mainContent = GoogleFonts.nunito(
      fontSize: 16, fontWeight: FontWeight.normal, color: textColor);

  static TextStyle largeTitle = GoogleFonts.roboto(
      fontSize: 32, fontWeight: FontWeight.bold, color: textColor);

  static TextStyle posterTitle = GoogleFonts.nunito(
      fontSize: 18, fontWeight: FontWeight.normal, color: textColor);

  static TextStyle logoStyle = GoogleFonts.nunito(
      fontSize: 24, fontWeight: FontWeight.bold, color: accentColor);

  static TextStyle logoHighlightStyle = GoogleFonts.nunito(
      fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white);

  static TextStyle floatingButtonStyle = GoogleFonts.roboto(
      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);
}
