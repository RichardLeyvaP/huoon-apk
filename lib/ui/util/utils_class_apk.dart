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
  //nuevos
  static Color colorRedOpaque = const Color.fromARGB(255, 218, 113, 113);
  static Color colorOpaqueBlue = const Color.fromARGB(255, 93, 137, 233);
  static Color colorGreenBlue = const Color.fromARGB(255, 3, 98, 108);
  static Color colorDarkGreen = const Color.fromARGB(255, 3, 34, 33);
  static Color colorYellowBurnt = const Color.fromARGB(255, 228, 159, 57);

  static Color getColorIndicador() {
    return colorIndicator; //color rojiso
  }

  static Color getColorPrimary() {
    return colorPrimary; //color azul claro
  }

  static Color getColorRedOpaque() {
    return colorRedOpaque; //color azul claro
  }

  static Color getColorOpaqueBlue() {
    return colorOpaqueBlue; //color azul claro
  }

  static Color getColorGreenBlue() {
    return colorGreenBlue; //color azul claro
  }

  static Color getColorDarkGreen() {
    return colorDarkGreen; //color azul claro
  }

  static Color getColorYellowBurnt() {
    return colorYellowBurnt; //color azul claro
  }
}
