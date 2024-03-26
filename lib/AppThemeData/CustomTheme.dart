import 'dart:ffi';
import 'package:flutter/material.dart';
import 'CustomThemeComponents.dart';
import 'CustomThemeColorSchema.dart';

var KcolorScheme = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));
var KDarkColorSchema = ColorScheme.fromSeed(brightness: Brightness.dark,seedColor: Color.fromARGB(255, 96, 59, 181));

ThemeData CustomThemePrimary() {
  return ThemeData().copyWith(
    useMaterial3: true,
    colorScheme: KcolorScheme,
    appBarTheme: CustomAppBarTheme() ,
    cardTheme: CustomCardTheme(ThemeProfile.primary),
    elevatedButtonTheme:CustomElevatedButtonThemeData(ThemeProfile.primary),
    textTheme: ThemeData().textTheme.copyWith(
      titleLarge: TextStyle(
        // this will overide the current title large
        fontWeight: FontWeight.bold,
        // color:  Colors.red
        color: KcolorScheme.onSecondaryContainer,

      )
    ),
  );
}

ThemeData CustomThemeDark(){
  return ThemeData.dark().copyWith(
      useMaterial3:true,
      colorScheme: KDarkColorSchema,
      cardTheme: CustomCardTheme(ThemeProfile.dark),
      elevatedButtonTheme: CustomElevatedButtonThemeData(ThemeProfile.dark)
  );
}










