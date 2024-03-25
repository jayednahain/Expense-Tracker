import 'package:flutter/material.dart';

var KcolorScheme = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));

ThemeData CustomTheme() {
  return ThemeData().copyWith(
    useMaterial3: true,
    colorScheme: KcolorScheme,
    appBarTheme: CustomAppBarTheme() ,
    cardTheme: CustomCardTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: KcolorScheme.primaryContainer
      )
    ),
    textTheme: ThemeData().textTheme.copyWith(
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: KcolorScheme.onSecondaryContainer,

      )
    ),

  );
}

AppBarTheme CustomAppBarTheme(){
  return const AppBarTheme().copyWith(
    backgroundColor: KcolorScheme.onPrimaryContainer,
    foregroundColor: KcolorScheme.primaryContainer,
  );
}

CardTheme CustomCardTheme(){
  return const CardTheme().copyWith(
      color: KcolorScheme.secondaryContainer,
      margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5
      )
  );
}



