import 'dart:ffi';

import 'package:expencetracker/ExpensesList.dart';
import 'package:expencetracker/Widgets/AddNewExpenseWidget.dart';
import 'package:expencetracker/Widgets/Chart/Chart.dart';
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

  final List<ExpenseModal> _RegisteredExpenseList =[
    ExpenseModal(
        title: "title",
        amount: 5.5,
        date: DateTime.now(),
        category: ExpenseCategory.food,
        paymentMethod: PaymentMethod.cashMoney),
    ExpenseModal(
        title: "title2",
        amount: 5.5,
        date: DateTime.now(),
        category: ExpenseCategory.travel,
        paymentMethod: PaymentMethod.cashMoney),
    ExpenseModal(
        title: "title3",
        amount: 5.5,
        date: DateTime.now(),
        category: ExpenseCategory.travel,
        paymentMethod: PaymentMethod.cashMoney),
    ExpenseModal(
        title: "title4",
        amount: 5.5,
        date: DateTime.now(),
        category: ExpenseCategory.food,
        paymentMethod: PaymentMethod.cashMoney),
    ExpenseModal(
        title: "title5",
        amount: 5.5,
        date: DateTime.now(),
        category: ExpenseCategory.food,
        paymentMethod: PaymentMethod.cashMoney),
  ];

  //106
  void _openAddExpenseOverlay(){
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx)=>
            AddNewExpenseWidget(
              onAddExpense: _addExpense
            )
    );
  }

  void _addExpense(ExpenseModal expense){
    setState(() {
      _RegisteredExpenseList.add(expense);
    });
  }
  // 120-1
  void _removeExpense(ExpenseModal expense){
    final currentItemIndex = _RegisteredExpenseList.indexOf(expense);
    setState(() {
      _RegisteredExpenseList.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    print(expense.title);
    // _showSnackBar(expense);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          content: const Text("Expense Deleted"),
          action: SnackBarAction(
            label: "undo",
            onPressed: (){
              setState(() {
                _RegisteredExpenseList.insert(currentItemIndex, expense);
              });
            },
          ),
        )
    );

  }

  void _showSnackBar(expense){
    print(expense.title);
    final currentItemIndex = _RegisteredExpenseList.indexOf(expense);
    print("currentItemIndex: $currentItemIndex");
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          content: const Text("Expense Deleted"),
          action: SnackBarAction(
            label: "undo",
            onPressed: (){
              setState(() {
                _RegisteredExpenseList.insert(currentItemIndex, expense);
              });

            },
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget mainContainer = const Center(
      child: Text("Empty expense list"),
    );

    if(_RegisteredExpenseList.isNotEmpty){
      mainContainer = ExpenseList(
        //120-2
          onRemoveExpense: _removeExpense,
          ExpenseListData:_RegisteredExpenseList
      );
    }

    return Scaffold(
      appBar: AppBar(
        // 105:
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: Icon(Icons.add)
          ),
        ],
      ),
      body: Column(
        children:  [
          Chart(expenseList: _RegisteredExpenseList),
          Expanded(
              child: mainContainer
          )
        ],
      ),
    );
  }
}
