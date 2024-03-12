import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Enums.dart';

final DateFormatter = DateFormat.yMd();

// 104:
const ExpenseCategoryIcon = {
  ExpenseCategory.food:Icons.lunch_dining,
  ExpenseCategory.travel:Icons.flight_takeoff,
  ExpenseCategory.work: Icons.work
};

class ExpenseModal {

  ExpenseModal ({
    // required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    this.description,
    required this.paymentMethod,
    this.tags = const [],
    this.imageUrl
  }) : id =DateTime.now().millisecondsSinceEpoch.toString();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;
  final String? description;
  final PaymentMethod paymentMethod;
  final List<String> tags;
  final String? imageUrl;

  String get FormattedDate{
    return  DateFormatter.format(date);
  }

}