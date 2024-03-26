import 'package:flutter/material.dart';
import 'CustomThemeColorSchema.dart';


AppBarTheme CustomAppBarTheme(){
  return const AppBarTheme().copyWith(
    backgroundColor: KcolorScheme.onPrimaryContainer,
    foregroundColor: KcolorScheme.primaryContainer,
  );
}

CardTheme CustomCardTheme(ThemeProfile profile) {
  switch (profile) {
    case ThemeProfile.primary:
      return CardTheme(
        color: KcolorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
      );
    case ThemeProfile.dark:
      return CardTheme(
        color: KDarkColorSchema.secondaryContainer,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
      );
  }
}

ElevatedButtonThemeData CustomElevatedButtonThemeData(ThemeProfile profile){
  switch (profile) {
    case ThemeProfile.primary:
      return  ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: KcolorScheme.primaryContainer,
              foregroundColor: KcolorScheme.onPrimaryContainer
          )
      );
    case ThemeProfile.dark:
      return ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: KDarkColorSchema.primaryContainer,
              foregroundColor: KDarkColorSchema.onPrimaryContainer
          )
      );
  }
}