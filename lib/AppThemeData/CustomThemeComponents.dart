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

SnackBarThemeData CustomSnackBarThemeData(ThemeProfile profile){
  switch (profile) {
    case ThemeProfile.primary:
      return SnackBarThemeData(
        contentTextStyle: TextStyle(
          color:KcolorScheme.secondaryContainer
        )
      );

    case ThemeProfile.dark:
      return SnackBarThemeData(
          contentTextStyle: TextStyle(
              color:KDarkColorSchema.secondaryContainer
          )
      );
  }
}

IconThemeData CustomIconThemeData(ThemeProfile profile){
  switch (profile) {
    case ThemeProfile.primary:
      return IconThemeData(
        color: KDarkColorSchema.secondaryContainer
      );


    case ThemeProfile.dark:
      return IconThemeData(
          color: KcolorScheme.secondaryContainer
      );

  }
}

