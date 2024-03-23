import 'package:flutter/material.dart';
import 'package:expencetracker/Expenses.dart';
void main() {
  runApp(const MyApp());
}


var KcolorScheme = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: KcolorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: KcolorScheme.onPrimaryContainer,
          foregroundColor: KcolorScheme.primaryContainer,
        )
      ),
      debugShowCheckedModeBanner: false,
      home: Expenses()
    );
  }
}
