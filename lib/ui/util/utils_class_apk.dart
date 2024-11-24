import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleGlobalApk {
  //fuentes
  // Define la fuente global en una variable
  static TextStyle globalTextStyle = GoogleFonts.poppins(); // Fuente que puede cambiarse fácilmente
  static TextStyle globalTitleApk = GoogleFonts.baloo2(); // Fuente que puede cambiarse fácilmente

  static TextStyle getStyleText() {
    return globalTextStyle;
  }

  static TextStyle getStyleTitleApk() {
    return globalTitleApk;
  }

  //
  //
  //
  //
  //colores
  static Color colorPrimary = const Color.fromARGB(255, 67, 162, 240);
  static Color colorIndicator = const Color.fromRGBO(255, 73, 73, 1.0);

  static Color getColorIndicador() {
    return colorIndicator; //color rojiso
  }

  static Color getColorPrimary() {
    return colorPrimary; //color azul claro
  }
}
