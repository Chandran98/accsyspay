import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors/colors.dart';

final lightMode = ThemeData(
  primaryColor: PrimaryColor,
  // fontFamily: "Poppins",
  iconTheme: IconThemeData(color: Colors.grey[900]),
  scaffoldBackgroundColor: Colors.grey.shade100,
  toggleButtonsTheme: ToggleButtonsThemeData(color: Colors.grey.shade100),
  brightness: Brightness.light,
  shadowColor: const Color(0xFFFFFFFF),
  primaryColorDark: Colors.grey[800],
  primaryColorLight: Colors.white,
  secondaryHeaderColor: Colors.grey[600],
  textTheme: TextTheme(
      subtitle1: GoogleFonts.inter(
          fontWeight: FontWeight.w500, fontSize: 16, color: Colors.grey[900]),
      subtitle2: GoogleFonts.inter(
          fontWeight: FontWeight.w500, fontSize: 22, color: Colors.grey[900])),
  appBarTheme:  AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(
        // color: Colors.grey[900],
        ),
    // actionsIconTheme: IconThemeData(color: Colors.grey[900]),
    titleTextStyle: GoogleFonts.inter(
      // fontFamily: 'Poppins',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.6,
      wordSpacing: 1,
      // color: Colors.grey[900],
    ),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: PrimaryColor,
    unselectedLabelColor: Colors.grey.shade500,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedIconTheme: const IconThemeData(color: PrimaryColor),
    unselectedIconTheme: const IconThemeData(color: Colors.grey),
    backgroundColor: Colors.white,
    selectedItemColor: PrimaryColor,
    unselectedItemColor: Colors.grey[500],
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: PrimaryColor.withOpacity(0.7)),
);

final darkMode = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: const IconThemeData(color: PrimaryColor),
      unselectedIconTheme: const IconThemeData(color: Colors.grey),
      backgroundColor: Colors.black,
      selectedItemColor: PrimaryColor,
      unselectedItemColor: Colors.grey[500],
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: PrimaryColor.withOpacity(0.7)),
    primaryColor: PrimaryColor,
    // fontFamily: "Poppins",
    iconTheme: const IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: const Color(0xff1F1D2A),
    primaryColorDark: const Color(0xff282633),
    toggleButtonsTheme: const ToggleButtonsThemeData(color: Colors.white),
    primaryColorLight: const Color(0xff282633),
    secondaryHeaderColor: const Color(0xff282633),
    brightness: Brightness.dark,
    shadowColor: const Color(0xff282828),
    textTheme:  TextTheme(
        subtitle1: GoogleFonts.inter(
            fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white)),
    appBarTheme:  AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      // color: Colors.grey[900],
      color: Color(0xff1F1D2A), elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      actionsIconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: GoogleFonts.inter(
        // fontFamily: 'Poppins',
        fontSize: 16,
        letterSpacing: -0.6,
        wordSpacing: 1,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
    // ignore: deprecated_member_use
    bottomAppBarColor: const Color(0xff1F1D2A),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white,
    ));
