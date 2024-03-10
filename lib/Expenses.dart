import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Models/Enums.dart';
import 'Models/ExpenseModal.dart';


class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {

  final List<ExpenseModal> _RegisteredExpenseModel =[
    ExpenseModal(
        title: "title",
        amount: 5.5,
        date: DateTime.now(),
        category: ExpenseCategory.food,
        paymentMethod: PaymentMethod.cashMoney),
    ExpenseModal(
        title: "title",
        amount: 5.5,
        date: DateTime.now(),
        category: ExpenseCategory.food,
        paymentMethod: PaymentMethod.cashMoney)
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Text("Cart"),
          Text("Cart")
        ],
      ),
    );
  }
}
