import 'package:expencetracker/AppThemeData/CustomTheme.dart';
import 'package:flutter/material.dart';
import 'package:expencetracker/Expenses.dart';
void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme(),
      debugShowCheckedModeBanner: false,
      home: Expenses()
    );
  }
}
