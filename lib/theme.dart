import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Google Fonts
/// https://fonts.google.com/?classification=Monospace
final textTheme = TextTheme(
  // display: openSans
  displayLarge: GoogleFonts.bebasNeue(
      height: 1, fontSize: 48, fontWeight: FontWeight.w400),
  displayMedium: GoogleFonts.bebasNeue(
      height: 1, fontSize: 40, fontWeight: FontWeight.w400),
  displaySmall: GoogleFonts.bebasNeue(
      height: 1, fontSize: 36, fontWeight: FontWeight.w400),
  // headline: openSans
  headlineLarge:
      GoogleFonts.bebasNeue(height: 1, fontSize: 32, fontWeight: FontWeight.w400),
  headlineMedium:
      GoogleFonts.bebasNeue(height: 1, fontSize: 28, fontWeight: FontWeight.w400),
  headlineSmall:
      GoogleFonts.bebasNeue(height: 1, fontSize: 24, fontWeight: FontWeight.w400),
  // title: openSans
  titleLarge: GoogleFonts.cairo(
      height: 1, fontSize: 22, fontWeight: FontWeight.w500),
  titleMedium: GoogleFonts.cairo(
      height: 1, fontSize: 18, fontWeight: FontWeight.w500),
  titleSmall: GoogleFonts.cairo(
      height: 1, fontSize: 16, fontWeight: FontWeight.w500),
  // body: roboto
  bodyLarge: GoogleFonts.cairo(
      height: 1, fontSize: 18, fontWeight: FontWeight.w400),
  bodyMedium: GoogleFonts.cairo(
      height: 1, fontSize: 16, fontWeight: FontWeight.w400),
  bodySmall: GoogleFonts.cairo(
      height: 1, fontSize: 12, fontWeight: FontWeight.w400),
  // label: kodeMono
  labelLarge: GoogleFonts.kodeMono(
      height: 1, fontSize: 14, fontWeight: FontWeight.w500),
  labelMedium: GoogleFonts.kodeMono(
      height: 1, fontSize: 12, fontWeight: FontWeight.w500),
  labelSmall: GoogleFonts.kodeMono(
      height: 1, fontSize: 11, fontWeight: FontWeight.w500),
);

const bottomSheetTheme = BottomSheetThemeData(
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(8), topLeft: Radius.circular(8))));
